/****************************************************************************
 *  mrimprotocol.h
 *
 *  Copyright (c) 2009 by Rusanov Peter <peter.rusanov@gmail.com>
 *
 ***************************************************************************
 *                                                                         *
 *   This library is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************
*****************************************************************************/

#include <QRegExp>
#include <QStringList>

#include "mrimprotocol.h"
#include "mrimaccount.h"
#include "utils.h"
#include <qutim/statusactiongenerator.h>

#include "ui/wizards/mrimaccountwizard.h"

MrimProtocol* MrimProtocol::self = 0;

struct MrimProtocolPrivate
{
    QHash<QString,MrimAccount*> m_accountsHash;
};

MrimProtocol::MrimProtocol() : p(new MrimProtocolPrivate())
{
    Q_ASSERT(!self);
    self = this;
}

MrimProtocol::~MrimProtocol()
{
}

QList<Account *> MrimProtocol::accounts() const
{
    QList<Account *> accounts;
    QHash<QString, MrimAccount* >::const_iterator it;

    for (it = p->m_accountsHash.begin(); it != p->m_accountsHash.end(); it++)
    {
        accounts.append(it.value());
    }
    return accounts;
}

Account *MrimProtocol::account(const QString &id) const
{
    return p->m_accountsHash.value(id);
}

void MrimProtocol::loadActions()
{
	QList<Status> statuses;
	statuses << Status(Status::Online)
			 << Status(Status::FreeChat)
			 << Status(Status::Away)
			 << Status(Status::NA)
			 << Status(Status::DND)
			 << Status(Status::Invisible)
			 << Status(Status::Offline);

	Status connectingStatus(Status::Connecting);
	connectingStatus.initIcon("mrim");
	Status::remember(connectingStatus, "mrim");

	foreach (Status status, statuses) {
		status.initIcon("mrim");
		Status::remember(status, "mrim");
		MenuController::addAction<MrimAccount>(new StatusActionGenerator(status));
	}
}

void MrimProtocol::addAccount(MrimAccount *account)
{
	p->m_accountsHash.insert(account->id(), account);
	emit accountCreated(account);
	connect(account, SIGNAL(destroyed(QObject*)), SLOT(removeAccount(QObject*)));
}

void MrimProtocol::loadAccounts()
{
	loadActions();
    QStringList accounts = config("general").value("accounts",QStringList());
	qDebug() << Q_FUNC_INFO << accounts;

    foreach (QString email, accounts) {
		addAccount(new MrimAccount(email));
    }
}

QVariant MrimProtocol::data(DataType type)
{
	switch (type) {
		case ProtocolIdName:
			return "E-Mail";
		case ProtocolContainsContacts:
			return true;
		default:
			return QVariant();
	}
}

void MrimProtocol::removeAccount(QObject *obj)
{
	p->m_accountsHash.remove(p->m_accountsHash.key(static_cast<MrimAccount*>(obj)));
}

MrimProtocol* MrimProtocol::instance()
{
    if (!self)
    {
        qWarning("MrimProtocol isn't created yet!");
    }
    return self;
}

MrimProtocol::AccountCreationError MrimProtocol::createAccount(const QString& email, const QString& password)
{
    AccountCreationError err = None;

    QString validEmail = Utils::stripEmail(email);

    if (!validEmail.isEmpty())
    {//email is compliant
        ConfigGroup cfg = config("general");
        QStringList accounts = cfg.value("accounts",QStringList());

        if (!accounts.contains(validEmail))
        {//account is new, saving
            MrimAccount *account = new MrimAccount(validEmail);
            account->config().group("general").setValue("passwd", password, Config::Crypted);
            account->config().sync();//save account settings
			addAccount(account);

            accounts << validEmail;
            cfg.setValue("accounts",accounts);
            cfg.sync(); //save global settings
        }
        else
        {
            err = AlreadyExists;
        }
    }
    else
    {
        err = InvalidArguments;
    }
    return err;
}
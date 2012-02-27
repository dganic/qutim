/****************************************************************************
**
** qutIM - instant messenger
**
** Copyright © 2011 Ruslan Nigmatullin <euroelessar@yandex.ru>
**
*****************************************************************************
**
** $QUTIM_BEGIN_LICENSE$
** This program is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation, either version 3 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
** See the GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program.  If not, see http://www.gnu.org/licenses/.
** $QUTIM_END_LICENSE$
**
****************************************************************************/

#include "systemintegration_p.h"
#include "objectgenerator.h"
#include <limits>
#include <QStringList>
#include <QWidget>
#include <QApplication>

// Throw it out to X11Integration
#ifdef Q_WS_X11
# include <QX11Info>
# include <X11/Xutil.h>
# include <X11/Xlib.h>
# include <X11/Xatom.h>
# ifdef KeyPress
#  undef KeyPress
# endif
# define MESSAGE_SOURCE_OLD            0
# define MESSAGE_SOURCE_APPLICATION    1
# define MESSAGE_SOURCE_PAGER          2
#ifdef Status
# undef Status
#endif
#endif //Q_WS_X11

namespace qutim_sdk_0_3
{
struct IntegrationData
{
	QList<SystemIntegration*> integrations;
	
	void init();
	template <typename T>
	SystemIntegration *find(T type);
};

Q_GLOBAL_STATIC_WITH_INITIALIZER(IntegrationData, integrationData, x->init())

inline bool integrationLessThan(SystemIntegration *a, SystemIntegration *b)
{
	return a->priority() > b->priority();
}

void IntegrationData::init()
{
	integrations.append(new DefaultSystemIntegration);
	foreach(const ObjectGenerator *gen, ObjectGenerator::module<SystemIntegration>()) {
		SystemIntegration *integration = gen->generate<SystemIntegration>();
		if (!integration->isAvailable()) {
			delete integration;
		} else {
			integration->init();
			integrations.append(integration);
		}
	}
	qSort(integrations.begin(), integrations.end(), integrationLessThan);
}

template <typename T>
Q_INLINE_TEMPLATE SystemIntegration *IntegrationData::find(T type)
{
	for (int i = 0; i < integrations.size(); i++) {
		if (integrations[i]->canHandle(type))
			return integrations[i];
	}
	return 0;
}

DefaultSystemIntegration::DefaultSystemIntegration()
{
}

DefaultSystemIntegration::~DefaultSystemIntegration()
{
}

void DefaultSystemIntegration::init()
{
}

bool DefaultSystemIntegration::isAvailable() const
{
	return true;
}

int DefaultSystemIntegration::priority()
{
	return std::numeric_limits<int>::min();
}

QVariant DefaultSystemIntegration::doGetValue(Attribute attr, const QVariant &data) const
{
	Q_UNUSED(attr);
	Q_UNUSED(data);
	return QVariant();
}

QVariant DefaultSystemIntegration::doProcess(Operation act, const QVariant &data) const
{
	switch (act) {
	case ShowWidget: {
		QWidget *widget = data.value<QWidget*>();
#if	defined(QUTIM_MOBILE_UI)
		widget->showMaximized();
#else
		widget->show();
#endif
		break;
	}
	// TODO: Throw it out to X11Integration
	case ActivateWidget: {
#ifdef Q_WS_X11
		const QVariantList list = data.toList();
		QWidget *widget = list[0].value<QWidget*>();
		bool switchDesktop = list.value(0, false).toBool();
		if (switchDesktop) {
			static Atom NET_ACTIVE_WINDOW = 0;
			XClientMessageEvent xev;
	
			if(NET_ACTIVE_WINDOW == 0) {
				Display *dpy      = QX11Info::display();
				NET_ACTIVE_WINDOW = XInternAtom(dpy, "_NET_ACTIVE_WINDOW", False);
			}
	
			xev.type         = ClientMessage;
			xev.window       = widget->winId();
			xev.message_type = NET_ACTIVE_WINDOW;
			xev.format       = 32;
			xev.data.l[0]    = MESSAGE_SOURCE_PAGER;
			xev.data.l[1]    = QX11Info::appUserTime();
			xev.data.l[2]    = xev.data.l[3] = xev.data.l[4] = 0;
	
			XSendEvent(QX11Info::display(), QX11Info::appRootWindow(), False, SubstructureNotifyMask | SubstructureRedirectMask, (XEvent*)&xev);
		}
#endif//Q_WS_X11
	}
	default:
		break;
	}
	return QVariant();
}

bool DefaultSystemIntegration::canHandle(Attribute attribute) const
{
	Q_UNUSED(attribute);
	return false;
}

bool DefaultSystemIntegration::canHandle(Operation operation) const
{
	return operation == ShowWidget
#ifdef Q_WS_X11
	        || operation == ActivateWidget
#endif
	        ;
}

SystemIntegration::SystemIntegration()
{
}

SystemIntegration::~SystemIntegration()
{
}

QVariant SystemIntegration::value(Attribute attr, const QVariant &data)
{
	if (SystemIntegration *integration = integrationData()->find(attr))
		return integration->doGetValue(attr, data);
	return QVariant();
}

QVariant SystemIntegration::process(Operation act, const QVariant &data)
{
	if (SystemIntegration *integration = integrationData()->find(act))
		return integration->doProcess(act, data);
	return QVariant();
}

void SystemIntegration::virtual_hook(int type, void *data)
{
	Q_UNUSED(type);
	Q_UNUSED(data);
}

void SystemIntegration::show(QWidget *widget)
{
	process(ShowWidget, qVariantFromValue(widget));
}

void SystemIntegration::activate(QWidget *widget, bool switchDesktop)
{
	QVariantList args;
	args << qVariantFromValue(widget) << switchDesktop;
	process(ActivateWidget, args);
}

}


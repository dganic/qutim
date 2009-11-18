/****************************************************************************
 *  icqcontact_p.h
 *
 *  Copyright (c) 2009 by Nigmatullin Ruslan <euroelessar@gmail.com>
 *                        Prokhin Alexey <alexey.prokhin@yandex.ru>
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

#include "icqcontact.h"

#ifndef ICQCONTACT_PH_H
#define ICQCONTACT_PH_H

struct IcqContactPrivate
{
	IcqAccount *account;
	QString uin;
	QString name;
	quint16 user_id;
	quint16 group_id;
	Status status;
};

#endif // ICQCONTACT_PH_H

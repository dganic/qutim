/****************************************************************************
 *  icon.cpp
 *
 *  Copyright (c) 2009 by Nigmatullin Ruslan <euroelessar@gmail.com>
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

#include "icon.h"
#include "iconbackend_p.h"
#include "iconloader.h"

//namespace qutim_sdk_0_3
//{
using namespace qutim_sdk_0_3;

Icon::Icon(const QString &name)
		: QIcon(IconLoader::instance() ? IconLoader::instance()->loadIcon(name) : QIcon()) // QIcon(QIcon::fromTheme(name)) //QIcon(new IconBackend(name))
{
}

Icon::Icon(const QIcon &icon) : QIcon(icon)
{
}
//}

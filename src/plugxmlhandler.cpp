/*
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Library General Public
License version 2 as published by the Free Software Foundation.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Library General Public License for more details.

You should have received a copy of the GNU Library General Public License
along with this library; see the file COPYING.LIB.  If not, write to
the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.
*/

#include "plugxmlhandler.h"
#include <QDebug>
#include <QSettings>
#include <QFileInfo>
#include <QDir>
#include <QUrl>
#include <QFile>
#include <QApplication> //FIXME

plugXMLHandler::plugXMLHandler(QObject *parent)
    : QObject(parent)
{
    QSettings settings(QSettings::defaultFormat(), QSettings::UserScope, "qutim/plugman", "plugman");
    QFileInfo config_dir = settings.fileName();
    QDir current_dir = qApp->applicationDirPath();
    if( config_dir.canonicalPath().contains( current_dir.canonicalPath() ) )
        package_db_path = current_dir.relativeFilePath( config_dir.absolutePath() );
    else
        package_db_path = config_dir.absolutePath();
    package_db_path.append("/packages.xml");
}

plugXMLHandler::~plugXMLHandler() {

}

QDomElement plugXMLHandler::createElementFromPackage(const packageInfo& package_info) {
    QDomDocument doc;
    QDomElement package = doc.createElement("package");

    QDomElement package_element;
    QHash<QString,QString>::const_iterator it = package_info.properties.begin();
    for (it = package_info.properties.begin(); it!=package_info.properties.end();it++) {
        package_element = doc.createElement(it.key());
        package_element.appendChild(doc.createTextNode(it.value()));
        package.appendChild(package_element);
    }

    package_element = doc.createElement("files");
    package.appendChild(package_element);
    foreach (QString name, package_info.files) {
        QDomElement file_name = doc.createElement("name");
        file_name.appendChild(doc.createTextNode(name));
        package_element.appendChild(file_name);
    }
    return package;
}

packageInfo plugXMLHandler::createPackageInfoFromNode(QDomNode n) {

    packageInfo package_info;
    while (!n.isNull()) {
        QDomElement e = n.toElement(); // try to convert the node to an element.
        if (!e.isNull()) {
            if (e.tagName() == "files") {
                package_info.files = createFilesList(e.firstChild());
            }
            else {
                package_info.properties[e.tagName()] =e.text();
            }
        }
        n = n.nextSibling();
    }
    return package_info;
}

QStringList plugXMLHandler::createFilesList(QDomNode n) {
    QStringList files;
    while (!n.isNull()) {
        QDomElement e = n.toElement();
        if (!e.isNull())
            files.append(e.text());
        n = n.nextSibling();
    }
    return files;
}


QHash< QString, packageInfo > plugXMLHandler::createPackageList(const QDomDocument& root) {

    QDomElement packages = root.documentElement();
    QHash< QString, packageInfo > packages_list;
    QDomNode n = packages.firstChild();
    while (!n.isNull()) {
        QDomElement e = n.toElement(); // try to convert the node to an element.
        if (!e.isNull()) {
            packageInfo package = createPackageInfoFromNode(n.firstChild());
            QString key = package.properties.value("type")+"/"+package.properties.value("name");
            packages_list.insert(key,package);
        }
        n = n.nextSibling();
    }
    return packages_list;
}

void plugXMLHandler::registerPackage(const packageInfo &package_info) {
    QDomDocument doc;
    QFile input(package_db_path);
    if (input.exists()) {
        if (!input.open(QIODevice::ReadOnly)) {
            emit error(tr("Unable to open file"));
            return;
        }
        if (!doc.setContent(&input)) {
            emit error(tr("Unable to set content"));
            return;
        }
        input.close();
    }
    if (doc.documentElement().isNull()) {
        QDomElement packages = doc.createElement("packages");
        packages.setAttribute("version","0.1");
        doc.appendChild(packages);

    }
    doc.documentElement().appendChild(createElementFromPackage(package_info));
    QFile output(QString(package_db_path+".lock"));
    if (!output.open(QIODevice::WriteOnly)) {
        emit error(tr("Unable to write file"));
        return;
    }
    QTextStream out(&output);
    doc.save(out,2,QDomNode::EncodingFromTextStream);
    output.close();
    input.remove();
    output.rename(package_db_path);
    return;
}

QStringList plugXMLHandler::removePackage(const QString &name, const QString &type) {
    QDomDocument doc_root;
    QFile input(package_db_path);
    QStringList files_list;
    if (!input.open(QIODevice::ReadWrite)) {
        input.close();
        emit error(tr("Can't read database. Check your pesmissions."));
        return QStringList();
    }
    if (!doc_root.setContent(&input)) {
        input.close();
        emit error(tr("Broken package database"));
        return QStringList();
    }

    QDomElement packages = doc_root.documentElement();
    QDomNodeList packages_node = packages.childNodes();
    for (int num = 0; num < packages_node.count(); num++)
    {
        QDomNode package = packages_node.item(num);
        if (package.firstChildElement("name").text() == name)
        {
            files_list = createFilesList(package.firstChildElement("files").firstChild());
            package.parentNode().removeChild(package);
            qDebug() << doc_root.toString();
            input.close();
            QFile output(QString(package_db_path+".lock"));
            if (!output.open(QIODevice::WriteOnly)) {
                emit error(tr("Unable to write file"));
                return QStringList ();
            }
            QTextStream out(&output);
            doc_root.save(out,2,QDomNode::EncodingFromTextStream);
            output.close();
            input.remove();
            output.rename(package_db_path);
            return files_list;
        }
    }
    input.close();
    return files_list;
}


packageInfo plugXMLHandler::getPackageInfo(const QString& filename) {
    QDomDocument doc;

    QFile input(filename);
    if (!input.open(QIODevice::ReadOnly)) {
        emit error(tr("unable to open file"));
    }
    if (!doc.setContent(&input)) {
        emit error(tr("unable to set content"));
    }
    input.close();
    return createPackageInfoFromNode(doc.documentElement().firstChild());
}

QHash< QString, packageInfo > plugXMLHandler::getPackageList(QString path) {
    QDomDocument doc_root;
    if (path.isNull())
        path = package_db_path;
    QFile input(path);
    if (!input.open(QIODevice::ReadOnly)) {
        emit error(tr("Unable to open file"));
		return QHash< QString, packageInfo > ();
    }
    if (!doc_root.setContent(&input)) {
        emit error(tr("Unable to set content"));
		return QHash< QString, packageInfo > ();
    }
    input.close();
    return createPackageList(doc_root);
}

packageInfo plugXMLHandler::getPackageInfoFromDB(const QString &name, const QString &type)
{
    QDomDocument doc_root;
    QFile input(package_db_path);
    QStringList files_list;
    if (!input.open(QIODevice::ReadOnly)) {
        //x3
        input.close();
        emit error(tr("Can't read database. Check your pesmissions."));
        return packageInfo();
    }
    if (!doc_root.setContent(&input)) {
        // x3
        input.close();
        emit error(tr("Broken package database"));
        return packageInfo();
    }

    QDomElement packages = doc_root.documentElement();
    QDomNodeList packages_node = packages.childNodes();
    for (int num = 0; num < packages_node.count(); num++)
    {
        QDomNode package = packages_node.item(num);
        qDebug () << package.firstChildElement("name").text() << name ;
        if (package.firstChildElement("name").text() == name)
        {
            return createPackageInfoFromNode(package.firstChildElement());
        }
    }
    return packageInfo();
}


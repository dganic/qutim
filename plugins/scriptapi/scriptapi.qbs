import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "scriptapi"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'script' ] }

	files: [
		"src/qtplugin/scriptdataitem.cpp",
		"src/qtplugin/scriptdataitem.h",
		"src/qtplugin/scriptenginedata.cpp",
		"src/qtplugin/scriptenginedata.h",
		"src/qtplugin/scriptextensionplugin.cpp",
		"src/qtplugin/scriptextensionplugin.h",
		"src/qtplugin/scriptinforequest.cpp",
		"src/qtplugin/scriptinforequest.h",
		"src/qtplugin/scriptmessage.cpp",
		"src/qtplugin/scriptmessage.h",
		"src/qtplugin/scriptmessagehandler.cpp",
		"src/qtplugin/scriptmessagehandler.h",
		"src/qtplugin/scriptmessagepropertyiterator.cpp",
		"src/qtplugin/scriptmessagepropertyiterator.h",
		"src/qtplugin/scriptservices.cpp",
		"src/qtplugin/scriptservices.h",
		"src/qtplugin/scriptsettingsitem.cpp",
		"src/qtplugin/scriptsettingsitem.h",
		"src/qtplugin/scriptsettingswidget.cpp",
		"src/qtplugin/scriptsettingswidget.h",
		"src/scriptengine.cpp",
		"src/scriptengine.h",
		"src/scriptmessageclass.cpp",
		"src/scriptmessageclass.h",
		"src/scriptmessagepropertyiterator.cpp",
		"src/scriptmessagepropertyiterator.h",
		"src/scriptplugin.cpp",
		"src/scriptplugin.h",
		"src/scriptpluginwrapper.cpp",
		"src/scriptpluginwrapper.h",
		"src/scriptsettingsconnector.cpp",
		"src/scriptsettingsconnector.h"
	]
}

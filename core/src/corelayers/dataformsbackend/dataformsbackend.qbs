import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "dataformsbackend"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }

	files: [
		"dataformsbackend.plugin.json",
		"abstractdatawidget.cpp",
		"abstractdatawidget.h",
		"dataformsbackend.cpp",
		"dataformsbackend.h",
		"datalayout.cpp",
		"datalayout.h",
		"modifiablewidget.cpp",
		"modifiablewidget.h",
		"widgetgenerator.cpp",
		"widgetgenerator.h",
		"widgets.cpp",
		"widgets.h"
	]
}

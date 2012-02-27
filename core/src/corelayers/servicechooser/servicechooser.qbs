import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "servicechooser"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"servicechooser.plugin.json",
		"pluginchooserwidget.cpp",
		"pluginchooserwidget.h",
		"protocolchooserwidget.cpp",
		"protocolchooserwidget.h",
		"servicechooser.cpp",
		"servicechooser.h",
		"servicechooserwidget.cpp",
		"servicechooserwidget.h",
		"servicechooserwidget.ui",
		"serviceitem.cpp",
		"serviceitem.h"
	]
}

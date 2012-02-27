import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "xsettingsdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"xsettingsdialog.plugin.json",
		"xsettingslayerimpl.cpp",
		"xsettingslayerimpl.h",
		"xsettingswindow.cpp",
		"xsettingswindow.h"
	]
}

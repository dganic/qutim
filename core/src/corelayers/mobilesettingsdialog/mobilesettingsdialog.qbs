import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "mobilesettingsdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "slidingstackedwidget" }

	files: [
		"mobilesettingsdialog.plugin.json",
		"mobilesettingslayerimpl.cpp",
		"mobilesettingslayerimpl.h",
		"mobilesettingswindow.cpp",
		"mobilesettingswindow.h"
	]
}

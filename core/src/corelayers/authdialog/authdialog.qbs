import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "authdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"authdialog.ui",
		"authdialogimpl_p.h",
		"authdialogplugin.cpp",
		"authdialogplugin.h",
		"authservice.cpp",
		"authservice.h"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "joinchatdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"joinchatdialog.plugin.json",
		"joinchatdialog.cpp",
		"joinchatdialog.h",
		"joinchatdialog.ui",
		"joinchatmodule.cpp",
		"joinchatmodule.h"
	]
}

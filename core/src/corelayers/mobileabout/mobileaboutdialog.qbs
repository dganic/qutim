import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "mobileaboutdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"mobileaboutdialog.plugin.json",
		"mobileaboutcreator.cpp",
		"mobileaboutcreator.h",
		"mobileaboutdialog.cpp",
		"mobileaboutdialog.h",
		"mobileaboutdialog.ui"
	]
}

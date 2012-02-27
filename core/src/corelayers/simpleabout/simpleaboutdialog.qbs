import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simpleaboutdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"simpleaboutdialog.plugin.json",
		"simpleaboutcreator.cpp",
		"simpleaboutcreator.h",
		"simpleaboutdialog.cpp",
		"simpleaboutdialog.h",
		"simpleaboutdialog.ui"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "password"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"password.plugin.json",
		"simplepassworddialog.cpp",
		"simplepassworddialog.h",
		"simplepasswordwidget.cpp",
		"simplepasswordwidget.h",
		"simplepasswordwidget.ui"
	]
}

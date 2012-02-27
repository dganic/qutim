import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simplecontactlistwidget"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"simplecontactlistwidget.plugin.json",
		"simplewidget.cpp",
		"simplewidget.h"
	]
}

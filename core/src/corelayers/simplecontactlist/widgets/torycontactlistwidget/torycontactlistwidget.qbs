import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "torycontactlistwidget"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"torycontactlistwidget.plugin.json",
		"torywidget.cpp",
		"torywidget.h"
	]
}

import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "textchat"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "adiumchat" }

	files: [
		"textchat.plugin.json",
		"textviewcontroller.cpp",
		"textviewcontroller.h",
		"textviewfactory.cpp",
		"textviewfactory.h",
		"textviewwidget.cpp",
		"textviewwidget.h"
	]
}

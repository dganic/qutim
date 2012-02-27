import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "vphotoalbum"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'declarative', 'opengl' ] }
	Depends { name: "vkontakte" }

	files: [
		"valbummodel.cpp",
		"valbummodel.h",
		"vphotoalbumplugin.cpp",
		"vphotoalbumplugin.h",
		"vphotoview.cpp",
		"vphotoview.h"
	]
}

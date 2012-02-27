import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "qticons"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "qxdg" }

	files: [
		"qticons.plugin.json",
		"iconsloaderimpl.cpp",
		"iconsloaderimpl.h"
	]
}

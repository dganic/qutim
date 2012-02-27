import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simpleactionbox"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"simpleactionbox.plugin.json",
		"simpleactionbox.cpp",
		"simpleactionbox.h"
	]
}

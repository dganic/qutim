import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simplerosterstorage"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"simplerosterstorage.plugin.json",
		"simplerosterstorage.cpp",
		"simplerosterstorage.h"
	]
}

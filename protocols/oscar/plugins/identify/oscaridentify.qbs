import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "oscaridentify"
	
	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	Depends { name: "oscar" }

	files: [
		"clientidentify.cpp",
		"clientidentify.h"
	]
}

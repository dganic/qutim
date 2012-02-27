import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "antiboss"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/antibossplugin.cpp",
		"src/antibossplugin.h"
	]
}

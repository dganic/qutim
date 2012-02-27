import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "emoedit"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/emoeditplugin.cpp",
		"src/emoeditplugin.h"
	]
}

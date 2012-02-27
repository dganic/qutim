import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "phononsound"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"/usr/lib/libphonon.so"
	]

	files: [
		"src/phononsoundbackend.cpp",
		"src/phononsoundbackend.h",
		"src/phononsoundplugin.cpp",
		"src/phononsoundplugin.h"
	]
}

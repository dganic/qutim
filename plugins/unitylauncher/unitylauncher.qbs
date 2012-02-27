import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "unitylauncher"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'dbus' ] }
	cpp.dynamicLibraries: [
		"dbusmenu-qt"
	]
	cpp.includePaths: [
		"/usr/include/dbusmenu-qt"
	]

	files: [
		"src/dockbase.cpp",
		"src/dockbase.h",
		"src/ulplugin.cpp",
		"src/ulplugin.h",
		"src/ulservice.cpp",
		"src/ulservice.h",
		"src/unitydock.cpp",
		"src/unitydock.h"
	]
}

import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "dbusnotifications"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'dbus' ] }

	files: [
		"src/dbusbackend.cpp",
		"src/dbusbackend.h",
		"src/dplugin.cpp",
		"src/dplugin.h",
		"src/dbusnotifications.cpp",
		"src/dbusnotifications.h"
	]
}

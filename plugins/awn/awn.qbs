import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "awn"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'dbus' ] }

	files: [
		"src/awn.cpp",
		"src/awn.h",
		"src/awnservice.cpp",
		"src/awnservice.h",
		"src/chatwindowcontroller.cpp",
		"src/chatwindowcontroller.h"
	]
}

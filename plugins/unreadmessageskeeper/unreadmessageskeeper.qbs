import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "unreadmessageskeeper"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/unreadmessageskeeper.cpp",
		"src/unreadmessageskeeper.h"
	]
}

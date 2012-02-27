import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "sessionhelper"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/sessionhelper.cpp",
		"src/sessionhelper.h"
	]
}

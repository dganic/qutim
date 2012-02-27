import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "logger"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'declarative' ] }

	files: [
		"src/logger.cpp",
		"src/logger.h"
	]
}

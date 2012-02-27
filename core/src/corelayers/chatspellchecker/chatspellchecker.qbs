import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "chatspellchecker"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"chatspellchecker.plugin.json",
		"chatspellchecker.cpp",
		"chatspellchecker.h"
	]
}

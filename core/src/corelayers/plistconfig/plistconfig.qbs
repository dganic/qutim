import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "plistconfig"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'xml' ] }

	files: [
		"plistconfig.plugin.json",
		"plistconfigbackend.cpp",
		"plistconfigbackend.h"
	]
}

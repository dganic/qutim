import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "jsonconfig"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"jsonconfig.plugin.json",
		"jsonconfigbackend.cpp",
		"jsonconfigbackend.h"
	]
}

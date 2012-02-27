import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "nocryptoservice"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"nocryptoservice.plugin.json",
		"nocryptoservice.cpp",
		"nocryptoservice.h"
	]
}

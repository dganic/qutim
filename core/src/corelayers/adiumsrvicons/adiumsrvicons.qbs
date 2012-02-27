import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "adiumsrvicons"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"adiumsrvicons.plugin.json",
		"serviceicons.cpp",
		"serviceicons.h"
	]
}

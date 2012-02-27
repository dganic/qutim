import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "proxysettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }

	files: [
		"proxysettings.plugin.json",
		"proxysettings.cpp",
		"proxysettings.h"
	]
}

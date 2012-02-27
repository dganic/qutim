import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "clconf"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/clconfplugin.cpp",
		"src/clconfplugin.h",
		"src/proxyaccount.cpp",
		"src/proxyaccount.h",
		"src/proxycontact.cpp",
		"src/proxycontact.h"
	]
}

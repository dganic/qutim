import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "qrcicons"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"qrcicons.plugin.json",
		"oxygen.qrc",
		"qresourceiconloader.cpp",
		"qresourceiconloader.h"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "contactinfo"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"contactinfo.plugin.json",
		"contactinfo.cpp",
		"contactinfo.h",
		"userinformation.ui"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "trayicon"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"trayicon.plugin.json",
		"simpletray.cpp",
		"simpletray.h",
		"simpletraysettings.cpp",
		"simpletraysettings.h",
		"simpletraysettings.ui"
	]
}

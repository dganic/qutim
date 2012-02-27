import qbs.base 1.0
import "../../../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "bearermanager"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }

	files: [
		"bearermanager.plugin.json",
		"bearermanager.cpp",
		"bearermanager.h",
		"managersettings.cpp",
		"managersettings.h",
		"managersettings.ui"
	]
}

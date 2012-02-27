import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "soundthemeselector"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"soundthemeselector.plugin.json",
		"soundthemeselector.cpp",
		"soundthemeselector.h",
		"soundthemeselector.ui",
		"soundthemesettings.cpp",
		"soundthemesettings.h"
	]
}

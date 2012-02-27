import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "emoticonssettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "flowlayout" }

	files: [
		"emoticonssettings.plugin.json",
		"emoticonsselector.cpp",
		"emoticonsselector.h",
		"emoticonsselector.ui",
		"emoticonssettings.cpp",
		"emoticonssettings.h"
	]
}

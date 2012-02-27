import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "urlpreview"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }

	files: [
		"src/messagehandler.cpp",
		"src/messagehandler.h",
		"src/urlpreview.cpp",
		"src/urlpreview.h",
		"src/urlpreviewsettings.cpp",
		"src/urlpreviewsettings.h",
		"src/urlpreviewsettings.ui"
	]
}

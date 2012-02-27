import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simpleactions"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/simpleactions.cpp",
		"src/simpleactions.h",
		"src/simpleactionsplugin.cpp",
		"src/simpleactionsplugin.h",
		"src/simpletagseditor/simpletagseditor.cpp",
		"src/simpletagseditor/simpletagseditor.h",
		"src/simpletagseditor/simpletagseditor.ui"
	]
}

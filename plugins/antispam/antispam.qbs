import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "antispam"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/antispamplugin.cpp",
		"src/antispamplugin.h",
		"src/handler.cpp",
		"src/handler.h",
		"src/settingswidget.cpp",
		"src/settingswidget.h",
		"src/settingswidget.ui"
	]
}

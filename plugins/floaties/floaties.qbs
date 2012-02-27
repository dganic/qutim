import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "floaties"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/contactwidget.cpp",
		"src/contactwidget.h",
		"src/floaties.cpp",
		"src/floaties.h",
		"src/floatiesitemmodel.cpp",
		"src/floatiesitemmodel.h"
	]
}

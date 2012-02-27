import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "adiumwebview"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'webkit' ] }
	Depends { name: "libqutim" }
	Depends { name: "adiumchat" }
	Depends { name: "qutim-adiumwebview" }

	files: [
		"adiumwebview.plugin.json",
		"src/adiumwebviewappearance.cpp",
		"src/adiumwebviewappearance.h",
		"src/adiumwebviewappearance.ui",
		"src/adiumwebviewcontroller.cpp",
		"src/adiumwebviewcontroller.h",
		"src/adiumwebviewfactory.cpp",
		"src/adiumwebviewfactory.h",
		"src/adiumwebviewvariable.cpp",
		"src/adiumwebviewvariable.h",
		"src/adiumwebviewwidget.cpp",
		"src/adiumwebviewwidget.h"
	]
}

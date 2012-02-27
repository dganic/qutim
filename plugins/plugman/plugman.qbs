import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "plugman"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"/usr/lib/libattica.so",
		"quasar"
	]

	files: [
		"icons.qrc",
		"src/packagedelegate.cpp",
		"src/packagedelegate.h",
		"src/packagedownloaddialog.cpp",
		"src/packagedownloaddialog.h",
		"src/packagedownloaddialog.ui",
		"src/packageengine.cpp",
		"src/packageengine.h",
		"src/packageentry.cpp",
		"src/packageentry.h",
		"src/packageentrywidget.cpp",
		"src/packageentrywidget.h",
		"src/packagemodel.cpp",
		"src/packagemodel.h",
		"src/packagepreviewwidget.cpp",
		"src/packagepreviewwidget.h",
		"src/plugman.cpp",
		"src/plugman.h"
	]
}

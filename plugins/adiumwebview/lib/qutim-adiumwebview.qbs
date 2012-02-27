import qbs.base 1.0

StaticLibrary {
	name: "qutim-adiumwebview"

	Depends { name: "cpp" }
	Depends { name: "libqutim" }
	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	
	files: [
		"adiumwebview_global.h",
		"webkitcolorsadditions.cpp",
		"webkitcolorsadditions_p.h",
		"webkitmessageviewcontroller.cpp",
		"webkitmessageviewcontroller.h",
		"webkitmessageviewstyle.cpp",
		"webkitmessageviewstyle.h",
		"webkitnetworkaccessmanager.cpp",
		"webkitnetworkaccessmanager.h",
		"webkitpreviewloader.cpp",
		"webkitpreviewloader.h",
		"webkitpreviewunits.cpp",
		"webkitpreviewunits_p.h"
	]
}

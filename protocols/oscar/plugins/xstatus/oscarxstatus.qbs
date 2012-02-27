import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "oscarxstatus"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	Depends { name: "oscar" }

	files: [
		"statusdialog.cpp",
		"statusdialog.h",
		"statusdialog.ui",
		"xstatus.cpp",
		"xstatus.h",
		"xstatusrequester.cpp",
		"xstatusrequester.h",
		"xstatussender.cpp",
		"xstatussender.h",
		"xstatussettings.cpp",
		"xstatussettings.h"
	]
}

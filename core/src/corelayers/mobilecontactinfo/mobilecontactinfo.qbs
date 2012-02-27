import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "mobilecontactinfo"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"mobilecontactinfo.plugin.json",
		"mobilecontactinfo.cpp",
		"mobilecontactinfo.h"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "notificationfilter"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"notificationfilter.plugin.json",
		"notificationfilter.cpp",
		"notificationfilter.h"
	]
}

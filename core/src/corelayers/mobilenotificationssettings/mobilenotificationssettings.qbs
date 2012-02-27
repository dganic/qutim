import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "mobilenotificationssettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"mobilenotificationssettings.plugin.json",
		"mobilenotificationsettings.cpp",
		"mobilenotificationsettings.h",
		"mobilenotificationssettings.cpp",
		"mobilenotificationssettings.h"
	]
}

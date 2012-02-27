import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "notificationssettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"notificationssettings.plugin.json",
		"notificationsettings.cpp",
		"notificationsettings.h",
		"notificationssettings.cpp",
		"notificationssettings.h"
	]
}

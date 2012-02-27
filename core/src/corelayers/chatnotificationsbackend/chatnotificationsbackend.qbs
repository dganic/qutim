import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "chatnotificationsbackend"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"chatnotificationsbackend.plugin.json",
		"chatnotificationsbackend.cpp",
		"chatnotificationsbackend.h"
	]
}

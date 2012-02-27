import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "filetransfersettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"filetransfersettings.plugin.json",
		"filetransfersettings.cpp",
		"filetransfersettings.h"
	]
}

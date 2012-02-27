import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "jsonhistory"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"jsonhistory.plugin.json",
		"historywindow.cpp",
		"historywindow.h",
		"historywindow.ui",
		"jsonhistory.cpp",
		"jsonhistory.h"
	]
}

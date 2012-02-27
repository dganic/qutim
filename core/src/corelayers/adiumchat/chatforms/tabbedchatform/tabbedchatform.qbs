import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "tabbedchatform"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "adiumchat" }
	
	files: [
		"tabbedchatform.plugin.json",
		"settings/tabbedchatbehavior.cpp",
		"settings/tabbedchatbehavior.h",
		"settings/tabbedchatbehavior.ui",
		"tabbar.cpp",
		"tabbar.h",
		"tabbedchatform.cpp",
		"tabbedchatform.h",
		"tabbedchatwidget.cpp",
		"tabbedchatwidget.h"
	]
}

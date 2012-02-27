import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "stackedchatform"
	
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "adiumchat" }
	Depends { name: "slidingstackedwidget" }
	

	files: [
		"stackedchatform.plugin.json",
		"floatingbutton.h",
		"kb_qwerty.cpp",
		"kb_qwerty.h",
		"kb_qwerty.ui",
		"settings/stackedchatbehavior.cpp",
		"settings/stackedchatbehavior.h",
		"settings/stackedchatbehavior.ui",
		"stackedchatform.cpp",
		"stackedchatform.h",
		"stackedchatwidget.cpp",
		"stackedchatwidget.h"
	]
}

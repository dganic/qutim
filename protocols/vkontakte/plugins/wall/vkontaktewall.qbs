import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "vkontaktewall"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	Depends { name: "vkontakte" }

	files: [
		"vwallmanager.cpp",
		"vwallmanager.h",
		"vwallsession.cpp",
		"vwallsession.h",
		"vwallsession_p.h"
	]
}

import qbs.base 1.0
import "../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "vkontakte"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'webkit' ] }

	files: [
		"src/ui/vaccountcreator.cpp",
		"src/ui/vaccountcreator.h",
		"src/ui/vaccountsettings.cpp",
		"src/ui/vaccountsettings.h",
		"src/ui/vaccountsettings.ui",
		"src/ui/vaccountwizardpage.ui",
		"src/vaccount.cpp",
		"src/vaccount.h",
		"src/vaccount_p.h",
		"src/vconnection.cpp",
		"src/vconnection.h",
		"src/vconnection_p.h",
		"src/vcontact.cpp",
		"src/vcontact.h",
		"src/vinforequest.cpp",
		"src/vinforequest.h",
		"src/vkontakte_global.h",
		"src/vkontakteplugin.cpp",
		"src/vkontakteplugin.h",
		"src/vkontakteprotocol.cpp",
		"src/vkontakteprotocol.h",
		"src/vkontakteprotocol_p.h",
		"src/vlongpollclient.cpp",
		"src/vlongpollclient.h",
		"src/vmessages.cpp",
		"src/vmessages.h",
		"src/vmessages_p.h",
		"src/vproxymanager.cpp",
		"src/vproxymanager.h",
		"src/vreply.cpp",
		"src/vreply.h",
		"src/vrequest.cpp",
		"src/vrequest.h",
		"src/vroster.cpp",
		"src/vroster.h",
		"src/vroster_p.h",
		"src/vutils.cpp"
	]
}

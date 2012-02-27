import qbs.base 1.0
import "../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "quetzal"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	cpp.dynamicLibraries: [
		"purple",
		"glib-2.0"
	]
	cpp.includePaths: [
		"/usr/include/glib-2.0",
		"/usr/lib/x86_64-linux-gnu/glib-2.0/include",
		"/usr/include/libpurple"
	]

	files: [
		"src/quatzelactiondialog.cpp",
		"src/quatzelactiondialog.h",
		"src/quatzelactiondialog.ui",
		"src/quetzalaccount.cpp",
		"src/quetzalaccount.h",
		"src/quetzalaccountsettings.cpp",
		"src/quetzalaccountsettings.h",
		"src/quetzalaccountwizard.cpp",
		"src/quetzalaccountwizard.h",
		"src/quetzalactiongenerator.cpp",
		"src/quetzalactiongenerator.h",
		"src/quetzalblist.cpp",
		"src/quetzalblist.h",
		"src/quetzalchat.cpp",
		"src/quetzalchat.h",
		"src/quetzalchatuser.cpp",
		"src/quetzalchatuser.h",
		"src/quetzalchoicedialog.cpp",
		"src/quetzalchoicedialog.h",
		"src/quetzalcontact.cpp",
		"src/quetzalcontact.h",
		"src/quetzalconverstion.cpp",
		"src/quetzalconverstion.h",
		"src/quetzaleventloop.cpp",
		"src/quetzaleventloop.h",
		"src/quetzalfieldsdialog.cpp",
		"src/quetzalfieldsdialog.h",
		"src/quetzalfiledialog.cpp",
		"src/quetzalfiledialog.h",
		"src/quetzalfiletransfer.cpp",
		"src/quetzalfiletransfer.h",
		"src/quetzalinputdialog.cpp",
		"src/quetzalinputdialog.h",
		"src/quetzaljoinchatdialog.cpp",
		"src/quetzaljoinchatdialog.h",
		"src/quetzaljoinchatdialog.ui",
		"src/quetzalnotify.cpp",
		"src/quetzalnotify.h",
		"src/quetzalplugin.cpp",
		"src/quetzalplugin.h",
		"src/quetzalprotocol.cpp",
		"src/quetzalprotocol.h",
		"src/quetzalproxymanager.cpp",
		"src/quetzalproxymanager.h",
		"src/quetzalrequest.cpp",
		"src/quetzalrequest.h",
		"src/quetzalrequestdialog.cpp",
		"src/quetzalrequestdialog.h"
	]
}

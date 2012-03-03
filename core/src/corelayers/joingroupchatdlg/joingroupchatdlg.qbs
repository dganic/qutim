import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "joingroupchatdlg"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "slidingstackedwidget" }
	cpp.includePaths: [
		"."
	]

	files: [
		"joingroupchatdlg.plugin.json",
		"accountsmodel.cpp",
		"accountsmodel.h",
		"bookmarksmodel.cpp",
		"bookmarksmodel.h",
		"bookmarkspage.cpp",
		"bookmarkspage.h",
		"groupchatpage.cpp",
		"groupchatpage.h",
		"joingroupchat.cpp",
		"joingroupchat.h",
		"joingroupchat.ui",
		"joingroupchatmodule.cpp",
		"joingroupchatmodule.h",
		"joinpage.cpp",
		"joinpage.h"
	]
}

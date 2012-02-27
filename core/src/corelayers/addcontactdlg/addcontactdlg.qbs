import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "addcontactdlg"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"addcontactdlg.plugin.json",
		"addcontactdlg.plugin.json",
		"addcontact.cpp",
		"addcontact.h",
		"addcontact.ui"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simplecontactdelegate"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"simplecontactdelegate/contactdelegate.cpp",
		"simplecontactdelegate/contactdelegate.h",
		"simplecontactdelegate/settings/simplecontactlistsettings.cpp",
		"simplecontactdelegate/settings/simplecontactlistsettings.h",
		"simplecontactdelegate/settings/simplecontactlistsettings.ui"
	]
}

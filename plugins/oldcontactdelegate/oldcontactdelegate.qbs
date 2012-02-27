import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "oldcontactdelegate"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'xml' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"contactlistitemdelegate.cpp",
		"contactlistitemdelegate.h",
		"settings/olddelegatesettings.cpp",
		"settings/olddelegatesettings.h",
		"settings/olddelegatesettings.ui"
	]
}

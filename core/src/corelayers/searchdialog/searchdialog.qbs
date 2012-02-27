import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "searchdialog"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"abstractsearchform.cpp",
		"abstractsearchform.h",
		"defaultform/defaultsearchform.cpp",
		"defaultform/defaultsearchform.h",
		"defaultform/defaultsearchform.ui",
		"mobileform/mobilesearchform.cpp",
		"mobileform/mobilesearchform.h",
		"mobileform/mobilesearchform.ui",
		"requestslistmodel.cpp",
		"requestslistmodel.h",
		"resultmodel.cpp",
		"resultmodel.h",
		"searchdialoglayer.cpp",
		"searchdialoglayer.h",
		"searchdialogplugin.cpp",
		"searchdialogplugin.h"
	]
}

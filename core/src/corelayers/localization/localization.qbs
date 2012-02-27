import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "localization"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"localizationmodule.cpp",
		"localizationmodule.h",
		"localizationplugin.cpp",
		"localizationplugin.h",
		"localizationsettings.cpp",
		"localizationsettings.h",
		"localizationsettings.ui"
	]
}

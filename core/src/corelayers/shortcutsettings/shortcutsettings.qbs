import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "shortcutsettings"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"shortcutsettings.plugin.json",
		"keysequencewidget.cpp",
		"keysequencewidget.h",
		"shortcutitemdelegate.cpp",
		"shortcutitemdelegate.h",
		"shortcutsettings.cpp",
		"shortcutsettings.h",
		"shortcutsettingswidget.cpp",
		"shortcutsettingswidget.h",
		"shortcutsettingswidget.ui"
	]
}

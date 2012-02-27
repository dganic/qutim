import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "idlestatuschanger"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"idlestatuschanger.plugin.json",
		"idle-global.h",
		"idlestatuschanger.cpp",
		"idlestatuschanger.h",
		"idlestatuswidget.cpp",
		"idlestatuswidget.h",
		"idlestatuswidget.ui"
	]
}

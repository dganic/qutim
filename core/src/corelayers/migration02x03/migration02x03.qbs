import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "migration02x03"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"migration02x03.plugin.json",
		"migrationpagecreator.cpp",
		"migrationpagecreator.h",
		"migrationstartpage.cpp",
		"migrationstartpage.h",
		"migrationstartpage.ui"
	]
}

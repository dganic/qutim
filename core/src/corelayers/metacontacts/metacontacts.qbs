import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "metacontacts"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"metacontacts.plugin.json",
		"factory.cpp",
		"factory.h",
		"manager.cpp",
		"manager.h",
		"mergedialog.cpp",
		"mergedialog.h",
		"mergedialog.ui",
		"metacontactimpl.cpp",
		"metacontactimpl.h",
		"model.cpp",
		"model.h"
	]
}

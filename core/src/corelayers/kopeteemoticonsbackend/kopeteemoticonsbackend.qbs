import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "kopeteemoticonsbackend"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'xml' ] }

	files: [
		"kopeteemoticonsbackend.plugin.json",
		"kopeteemoticonsbackend.cpp",
		"kopeteemoticonsbackend.h",
		"kopeteemoticonsprovider.cpp",
		"kopeteemoticonsprovider.h"
	]
}

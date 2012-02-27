import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "oldsoundtheme"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'xml' ] }

	files: [
		"oldsoundtheme.plugin.json",
		"oldsoundthemebackend.cpp",
		"oldsoundthemebackend.h",
		"oldsoundthemeprovider.cpp",
		"oldsoundthemeprovider.h"
	]
}

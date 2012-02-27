import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "accountcreator"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"accountcreator.cpp",
		"accountcreator.h",
		"accountcreatorlist.cpp",
		"accountcreatorlist.h",
		"accountcreatorlist.ui",
		"accountcreatorprotocols.cpp",
		"accountcreatorprotocols.h",
		"accountcreatorprotocols.ui",
		"accountcreatorwizard.cpp",
		"accountcreatorwizard.h"
	]
}

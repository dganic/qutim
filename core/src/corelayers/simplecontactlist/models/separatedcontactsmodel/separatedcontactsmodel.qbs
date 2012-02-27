import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "separatedcontactsmodel"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"separatedcontactsmodel.plugin.json",
		"separatedcontactlistmodel.cpp",
		"separatedcontactlistmodel.h"
	]
}

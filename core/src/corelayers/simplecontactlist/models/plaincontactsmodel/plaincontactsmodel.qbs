import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "plaincontactsmodel"
	
	Depends { name: "simplecontactlist" }
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"plaincontactsmodel.plugin.json",
		"plaincontactlistmodel.cpp",
		"plaincontactlistmodel.h"
	]
}

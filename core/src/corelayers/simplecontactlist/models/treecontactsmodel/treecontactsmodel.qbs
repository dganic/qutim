import qbs.base 1.0
import "../../../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "treecontactsmodel"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "simplecontactlist" }

	files: [
		"treecontactsmodel.plugin.json",
		"simplecontactlistmodel.cpp",
		"simplecontactlistmodel.h"
	]
}

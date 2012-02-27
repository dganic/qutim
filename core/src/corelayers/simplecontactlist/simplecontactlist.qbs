import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "simplecontactlist"
	
	Depends { name: "qutimutils" }
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	
	qutimutils.headersInstallDir: "qutim/simplecontactlist"
	
	ProductModule {
		Depends { name: "cpp" }
		cpp.includePaths: [
			buildDirectory
		]
	}
	
	Group {
		fileTags: [ "devHeaders", "hpp" ]
		files: [
		"simplecontactlist.plugin.json",
			"contactlist/abstractcontactlist.h",
			"contactlist/abstractcontactmodel.h",
			"contactlist/simplecontactlistview.h",
			"contactlist/simplestatusdialog.h",
			"contactlist/simplecontactlist.h",
			"contactlist/simplecontactlistitem.h",
			"contactlist/simplecontactlistsettings.h",
			"contactlist/lineedit.h"
		]
	}
	
	files: [
		"simplecontactlist.plugin.json",
		"contactlist/abstractcontactlist.cpp",
		"contactlist/abstractcontactmodel.cpp",
		"contactlist/abstractcontactmodel_p.h",
		"contactlist/lineedit.cpp",
		"contactlist/simplecontactlist.cpp",
		"contactlist/simplecontactlist.h",
		"contactlist/simplecontactlist_global.h",
		"contactlist/simplecontactlistitem.cpp",
		"contactlist/simplecontactlistsettings.cpp",
		"contactlist/simplecontactlistview.cpp",
		"contactlist/simplestatusdialog.cpp",
		"contactlist/simplestatusdialog.ui",
		"contactlist/tagsfilterdialog.cpp",
		"contactlist/tagsfilterdialog.h",
		"contactlist/tagsfilterdialog.ui"
	]
}

import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "filetransfer"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"filetransfer.plugin.json",
		"filetransferdialog.cpp",
		"filetransferdialog.h",
		"filetransferdialog.ui",
		"filetransferjobdelegate.cpp",
		"filetransferjobdelegate.h",
		"filetransferjobmodel.cpp",
		"filetransferjobmodel.h",
		"simplefiletransfer.cpp",
		"simplefiletransfer.h"
	]
}

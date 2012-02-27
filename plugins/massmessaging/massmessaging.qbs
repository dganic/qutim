import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "massmessaging"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/manager.cpp",
		"src/manager.h",
		"src/messaging.cpp",
		"src/messaging.h",
		"src/messagingdialog.cpp",
		"src/messagingdialog.h",
		"src/messagingdialog.ui"
	]
}

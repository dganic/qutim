import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "qmlchat"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'declarative', 'opengl' ] }
	Depends { name: "libqutim" }
	Depends { name: "adiumchat" }

	files: [
		"qmlchat.plugin.json",
		"quickchatviewcontroller.cpp",
		"quickchatviewcontroller.h",
		"quickchatviewfactory.cpp",
		"quickchatviewfactory.h",
		"quickchatviewwidget.cpp",
		"quickchatviewwidget.h",
		"settings/chatappearance.cpp",
		"settings/chatappearance.h",
		"settings/chatappearance.ui"
	]
}

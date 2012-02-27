import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "dbusapi"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'dbus' ] }

	files: [
		"src/accountadaptor.cpp",
		"src/accountadaptor.h",
		"src/buddyadapter.cpp",
		"src/buddyadapter.h",
		"src/chatlayeradapter.cpp",
		"src/chatlayeradapter.h",
		"src/chatsessionadapter.cpp",
		"src/chatsessionadapter.h",
		"src/chatunitadaptor.cpp",
		"src/chatunitadaptor.h",
		"src/conferenceadaptor.cpp",
		"src/conferenceadaptor.h",
		"src/contactadaptor.cpp",
		"src/contactadaptor.h",
		"src/dbusplugin.cpp",
		"src/dbusplugin.h",
		"src/protocoladaptor.cpp",
		"src/protocoladaptor.h"
	]
}

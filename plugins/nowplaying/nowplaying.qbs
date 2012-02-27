import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "nowplaying"

	Depends { name: "qutimutils" }
	Depends { name: "qt"; submodules: [ 'core', 'gui', 'dbus' ] }
	qutimutils.headersInstallDir: "qutim/nowplaying"
	
	Group {
		fileTags: [ "devHeaders", "hpp" ]
		files: [
			"include/player.h",
			"include/playersettings.h",
			"include/trackinfo.h"
		]
	}

	files: [
		"players/mpris/mprisplayer.cpp",
		"players/mpris/mprisplayer.h",
		"players/mpris/mprisplayerfactory.cpp",
		"players/mpris/mprisplayerfactory.h",
		"res.qrc",
		"src/accounttunestatus.cpp",
		"src/accounttunestatus.h",
		"src/icqsettings.ui",
		"src/icqsupport.cpp",
		"src/icqsupport.h",
		"src/jabbersettings.ui",
		"src/jabbersupport.cpp",
		"src/jabbersupport.h",
		"src/nowplaying.cpp",
		"src/nowplaying.h",
		"src/nowplayingsettings.ui",
		"src/settingsui.cpp",
		"src/settingsui.h"
	]
}

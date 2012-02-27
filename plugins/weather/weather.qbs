import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "weather"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'xml' ] }

	files: [
		"src/waccount.cpp",
		"src/waccount.h",
		"src/wcontact.cpp",
		"src/wcontact.h",
		"src/weather.cpp",
		"src/weather.h",
		"src/wlistitem.cpp",
		"src/wlistitem.h",
		"src/wmanager.cpp",
		"src/wmanager.h",
		"src/wprotocol.cpp",
		"src/wprotocol.h",
		"src/wsettings.cpp",
		"src/wsettings.h",
		"src/wsettings.ui",
		"weather.qrc"
	]
}

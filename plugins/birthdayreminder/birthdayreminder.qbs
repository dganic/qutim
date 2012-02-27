import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "birthdayreminder"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }

	files: [
		"src/birthdayreminder.cpp",
		"src/birthdayreminder.h",
		"src/birthdayremindersettings.cpp",
		"src/birthdayremindersettings.h",
		"src/birthdayremindersettings.ui"
	]
}

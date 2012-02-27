import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "kineticscroller"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'webkit' ] }
	cpp.includePaths: [
		"."
	]

	files: [
		"kineticscroller.plugin.json",
		"kineticscroller.cpp",
		"kineticscroller.h",
		"kineticscrollersettings.cpp",
		"kineticscrollersettings.h",
		"kineticscrollersettings.ui",
		"qtflickgesture.cpp",
		"qtflickgesture_p.h",
		"qtscroller.cpp",
		"qtscroller.h",
		"qtscroller_mac.mm",
		"qtscroller_p.h",
		"qtscrollerfilter.cpp",
		"qtscrollerfilter_p.h",
		"qtscrollerproperties.cpp",
		"qtscrollerproperties.h",
		"qtscrollerproperties_p.h",
		"qtscrollevent.cpp",
		"qtscrollevent.h",
		"qtscrollevent_p.h"
	]
}

import qbs.base 1.0
import "../../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "kineticpopups"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'declarative' ] }

	files: [
		"kineticpopups.plugin.json",
		"backend.cpp",
		"backend.h",
		"kineticpopup.cpp",
		"kineticpopup.h",
		"popupwidgets/quickpopupwidget.cpp",
		"popupwidgets/quickpopupwidget.h",
		"settings/popupappearance.cpp",
		"settings/popupappearance.h",
		"settings/popupappearance.ui",
		"widgetplacer.cpp",
		"widgetplacer.h"
	]
}

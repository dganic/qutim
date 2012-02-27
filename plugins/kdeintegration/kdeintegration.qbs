import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "kdeintegration"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"KDE4__kutils",
		"KDE4__kio",
		"KDE4__knotifyconfig"
	]

	files: [
		"src/aboutapp/kdeaboutappdialog.cpp",
		"src/aboutapp/kdeaboutappdialog.h",
		"src/aboutkde/aboutkdedialog.cpp",
		"src/aboutkde/aboutkdedialog.h",
		"src/crash/crashplugin.cpp",
		"src/crash/crashplugin.h",
		"src/emoticons/kdeemoticons.cpp",
		"src/emoticons/kdeemoticons.h",
		"src/emoticons/kdeemoticonsprovider.cpp",
		"src/emoticons/kdeemoticonsprovider.h",
		"src/iconloader/kdeiconloader.cpp",
		"src/iconloader/kdeiconloader.h",
		"src/kdeintegration.cpp",
		"src/kdeintegration.h",
		"src/quetzalgui.cpp",
		"src/quetzalgui.h",
		"src/speller/kdespellerlayer.cpp",
		"src/speller/kdespellerlayer.h",
		"src/speller/kdespellersettings.cpp",
		"src/speller/kdespellersettings.h",
		"src/speller/kdespellersettings.ui",
		"src/sysintegration/kdesystemintegration.cpp",
		"src/sysintegration/kdesystemintegration.h",
		"src/tray/kdetrayicon.cpp",
		"src/tray/kdetrayicon.h"
	]
}

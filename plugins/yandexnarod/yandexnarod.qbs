import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "yandexnarod"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'xml', 'network' ] }

	files: [
		"src/requestauthdialog.cpp",
		"src/requestauthdialog.h",
		"src/requestauthdialog.ui",
		"src/yandexnarod.cpp",
		"src/yandexnarod.h",
		"src/yandexnarodauthorizator.cpp",
		"src/yandexnarodauthorizator.h",
		"src/yandexnarodmanage.cpp",
		"src/yandexnarodmanage.h",
		"src/yandexnarodmanage.ui",
		"src/yandexnarodnetman.cpp",
		"src/yandexnarodnetman.h",
		"src/yandexnarodsettings.cpp",
		"src/yandexnarodsettings.h",
		"src/yandexnarodsettings.ui",
		"src/yandexnaroduploadjob.cpp",
		"src/yandexnaroduploadjob.h",
		"yandexnarod.qrc"
	]
}

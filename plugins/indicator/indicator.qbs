import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "indicator"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"indicate-qt"
	]
	cpp.includePaths: [
		"/usr/include/libindicate-qt"
	]

	files: [
		"src/indicator.cpp",
		"src/indicator.h",
		"src/indicatorservice.cpp",
		"src/indicatorservice.h"
	]
}

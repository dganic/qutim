import qbs.base 1.0
import "../../../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "multimediabackend"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"/usr/lib/libQtMultimediaKit.so"
	]
	cpp.includePaths: [
		"/usr/include/QtMultimediaKit",
		"/usr/include/QtMobility"
	]

	files: [
		"multimediabackend.plugin.json",
		"multimediasoundbackend.cpp",
		"multimediasoundbackend.h"
	]
}

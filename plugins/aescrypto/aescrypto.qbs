import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "aescrypto"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }
	cpp.dynamicLibraries: [
		"/usr/lib/libqca.so"
	]
	cpp.includePaths: [
		"/usr/include/QtCrypto"
	]

	files: [
		"src/aescryptomodule.cpp",
		"src/aescryptomodule.h",
		"src/aescryptoservice.cpp",
		"src/aescryptoservice.h"
	]
}

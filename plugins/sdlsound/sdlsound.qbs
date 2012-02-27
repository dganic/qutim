import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "sdlsound"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"SDL_mixer",
		"SDL"
	]

	files: [
		"src/sdlbackend.cpp",
		"src/sdlbackend.h",
		"src/sdlplugin.cpp",
		"src/sdlplugin.h"
	]
}

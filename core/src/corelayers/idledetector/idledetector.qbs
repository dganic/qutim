import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "idledetector"

	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	cpp.dynamicLibraries: [
		"/usr/lib/x86_64-linux-gnu/libXss.so"
	]

	files: [
		"idledetector.plugin.json",
		"idle.cpp",
		"idle.h",
		"idle_mac.cpp",
		"idle_win.cpp",
		"idle_x11.cpp"
	]
}

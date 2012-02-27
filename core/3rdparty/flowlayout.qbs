import qbs.base 1.0

StaticLibrary {
	name: "flowlayout"

	Depends { name: "cpp" }
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	
	ProductModule {
		cpp.includePaths: [
			"flowlayout"
		]
	}
	
	files: [
		"flowlayout/flowlayout.cpp",
		"flowlayout/flowlayout.h"
	]
}

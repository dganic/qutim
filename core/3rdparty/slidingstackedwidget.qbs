import qbs.base 1.0

StaticLibrary {
	name: "slidingstackedwidget"

	Depends { name: "cpp" }
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	
	ProductModule {
		cpp.includePaths: [
			"slidingstackedwidget"
		]
	}
	
	files: [
		"slidingstackedwidget/fingerswipegesture.cpp",
		"slidingstackedwidget/fingerswipegesture.h",
		"slidingstackedwidget/slidingstackedwidget.cpp",
		"slidingstackedwidget/slidingstackedwidget.h"
	]
}

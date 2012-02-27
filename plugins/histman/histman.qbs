import qbs.base 1.0
import "../QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "histman"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'sql', 'xml' ] }

	files: [
		"src/chooseclientpage.cpp",
		"src/chooseclientpage.h",
		"src/chooseclientpage.ui",
		"src/chooseordumppage.cpp",
		"src/chooseordumppage.h",
		"src/chooseordumppage.ui",
		"src/clientconfigpage.cpp",
		"src/clientconfigpage.h",
		"src/clientconfigpage.ui",
		"src/clients/andrq.cpp",
		"src/clients/andrq.h",
		"src/clients/gajim.cpp",
		"src/clients/gajim.h",
		"src/clients/jimm.cpp",
		"src/clients/jimm.h",
		"src/clients/kopete.cpp",
		"src/clients/kopete.h",
		"src/clients/licq.cpp",
		"src/clients/licq.h",
		"src/clients/miranda.cpp",
		"src/clients/miranda.h",
		"src/clients/pidgin.cpp",
		"src/clients/pidgin.h",
		"src/clients/psi.cpp",
		"src/clients/psi.h",
		"src/clients/qip.cpp",
		"src/clients/qip.h",
		"src/clients/qipinfium.cpp",
		"src/clients/qipinfium.h",
		"src/clients/qippda.cpp",
		"src/clients/qippda.h",
		"src/clients/qutim.cpp",
		"src/clients/qutim.h",
		"src/clients/sim.cpp",
		"src/clients/sim.h",
		"src/dumphistorypage.cpp",
		"src/dumphistorypage.h",
		"src/dumphistorypage.ui",
		"src/historymanagerplugin.cpp",
		"src/historymanagerplugin.h",
		"src/historymanagerwindow.cpp",
		"src/historymanagerwindow.h",
		"src/historymanagerwindow.ui",
		"src/importhistorypage.cpp",
		"src/importhistorypage.h",
		"src/importhistorypage.ui"
	]
}

import qbs.base 1.0
import "../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "mrim"

	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network' ] }

	files: [
		"src/3rdparty/rtf/rtfreader.cpp",
		"src/3rdparty/rtf/rtfreader.h",
		"src/3rdparty/rtf/rtftextreader.cpp",
		"src/3rdparty/rtf/rtftextreader.h",
		"src/base/lpstring.cpp",
		"src/base/lpstring.h",
		"src/base/messages.cpp",
		"src/base/messages.h",
		"src/base/mrimaccount.cpp",
		"src/base/mrimaccount.h",
		"src/base/mrimconnection.cpp",
		"src/base/mrimconnection.h",
		"src/base/mrimcontact.cpp",
		"src/base/mrimcontact.h",
		"src/base/mrimdebug.cpp",
		"src/base/mrimdebug.h",
		"src/base/mrimdefs.h",
		"src/base/mrimpacket.cpp",
		"src/base/mrimpacket.h",
		"src/base/mrimplugin.cpp",
		"src/base/mrimplugin.h",
		"src/base/mrimprotocol.cpp",
		"src/base/mrimprotocol.h",
		"src/base/mrimstatus.cpp",
		"src/base/mrimstatus.h",
		"src/base/proto.h",
		"src/base/protoutils.cpp",
		"src/base/protoutils.h",
		"src/base/regionlistparser.cpp",
		"src/base/regionlistparser.h",
		"src/base/roster.cpp",
		"src/base/roster.h",
		"src/base/rtfutils.cpp",
		"src/base/rtfutils.h",
		"src/base/useragent.cpp",
		"src/base/useragent.h",
		"src/base/utils.cpp",
		"src/base/utils.h",
		"src/ui/wizards/accountwizardmain.cpp",
		"src/ui/wizards/accountwizardmain.h",
		"src/ui/wizards/accountwizardmain.ui",
		"src/ui/wizards/mrimaccountwizard.cpp",
		"src/ui/wizards/mrimaccountwizard.h"
	]
}

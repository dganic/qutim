import qbs.base 1.0
import "../../../../plugins/QutimPlugin.qbs" as QutimPlugin

QutimPlugin {
	name: "adiumchat"
	
	Depends { name: "qt"; submodules: [ 'core', 'gui' ] }
	Depends { name: "qutimutils" }
	Depends { name: "flowlayout" }
	
	qutimutils.headersInstallDir: "qutim/adiumchat"
	
	ProductModule {
		Depends { name: "cpp" }
		cpp.includePaths: [
			buildDirectory
		]
	}
	
	Group {
		fileTags: [ "devHeaders", "hpp" ]
		files: [
			"chatlayer/chatforms/abstractchatform.h",
			"chatlayer/chatforms/abstractchatwidget.h",
			"chatlayer/chatedit.h",
			"chatlayer/chatlayer_global.h",
			"chatlayer/chatlayerimpl.h",
			"chatlayer/chatlayerplugin.h",
			"chatlayer/chatsessionimpl.h",
			"chatlayer/chatsessionmodel.h",
			"chatlayer/chatviewfactory.h",
			"chatlayer/conferencecontactsview.h",
			"chatlayer/conferencetabcompletion.h",
			"chatlayer/sessionlistwidget.h"
		]
	}

	files: [
		"chatlayer/actions/chatemoticonswidget.cpp",
		"chatlayer/actions/chatemoticonswidget.h",
		"chatlayer/chatedit.cpp",
		"chatlayer/chatforms/abstractchatform.cpp",
		"chatlayer/chatforms/abstractchatwidget.cpp",
		"chatlayer/chatlayerimpl.cpp",
		"chatlayer/chatlayerplugin.cpp",
		"chatlayer/chatsessionimpl.cpp",
		"chatlayer/chatsessionimpl_p.h",
		"chatlayer/chatsessionmodel.cpp",
		"chatlayer/chatviewfactory.cpp",
		"chatlayer/conferencecontactsview.cpp",
		"chatlayer/conferencetabcompletion.cpp",
		"chatlayer/sessionlistwidget.cpp"
	]
}

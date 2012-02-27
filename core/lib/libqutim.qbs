import qbs.base 1.0

DynamicLibrary {
	name: "libqutim"
	destination: "lib"
	property string qutim_version_major: project.qutim_version_major
	property string qutim_version_minor: project.qutim_version_minor
	property string qutim_version_release: project.qutim_version_release
	property string qutim_version_patch: project.qutim_version_patch
	property string qutim_version: project.qutim_version
	
	Depends { name: "qutimutils" }
	Depends { name: "k8json" }
	Depends { name: "cpp" }
	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'script' ] }
	
	//qutimutils.headersInstallDir: "include/qutim"
	cpp.includePaths: [
		path,
		path + "/qutim",
		buildDirectory + "/qutim",
		"../3rdparty"
	]
	cpp.dynamicLibraryPrefix: ""
	cpp.staticLibraryPrefix: ""
	cpp.defines: [ "LIBQUTIM_LIBRARY" ]
	
	
	cpp.dynamicLibraries: {
		if (qbs.targetOS == 'linux' || qbs.targetOS == 'freebsd') {
			return [ 'X11' ];
		}
		return [];
	}
	
	FileTagger {
		pattern: "*[a-z]?.h"
		fileTags: [ "devHeaders" ]
	}
	
	ProductModule {
		Depends { name: "cpp" }
		cpp.includePaths: [
			buildDirectory
		]
	}
	
	Transformer {
		inputs: [ "version.h.cmake" ]
		Artifact {
			fileName: "qutim/libqutim_version.h"
			fileTags: [ "hpp" ]
		}
		prepare: {
			var cmd = new JavaScriptCommand();
			cmd.description = "generating libqutim_version.h";
			cmd.highlight = "codegen";
			cmd.qutim_version = product.qutim_version;
			cmd.qutim_version_major = product.qutim_version_major;
			cmd.qutim_version_minor = product.qutim_version_minor;
			cmd.qutim_version_release = product.qutim_version_release;
			cmd.qutim_version_patch = product.qutim_version_patch;
			cmd.onWindows = (product.modules.qbs.targetOS == "windows");
			cmd.sourceCode = function() {
				var file = new TextFile(input.fileName);
				var content = file.readAll();
				// replace Windows line endings
				if (onWindows)
					content = content.replace(/\r\n/g, "\n");
				content = content.replace(/\${CMAKE_QUTIM_VERSION_STRING}/g, qutim_version);
				content = content.replace(/\${CMAKE_QUTIM_VERSION_MAJOR}/g, qutim_version_major);
				content = content.replace(/\${CMAKE_QUTIM_VERSION_MINOR}/g, qutim_version_minor);
				content = content.replace(/\${CMAKE_QUTIM_VERSION_SECMINOR}/g, qutim_version_release);
				content = content.replace(/\${CMAKE_QUTIM_VERSION_PATCH}/g, qutim_version_patch);
				file = new TextFile(output.fileName, TextFile.WriteOnly);
				file.truncate();
				file.write(content);
				file.close();
				var global = output.fileName.replace("libqutim_version.h", "libqutim_global.h");
				file = new TextFile(global, TextFile.WriteOnly);
				file.truncate();
				file.write("#include \"" + input.fileName.replace("version.h.cmake", "qutim/libqutim_global.h") + "\"\n");
				file.close();
				var local = output.fileName.replace("qutim/libqutim_version.h", "libqutim_version.h");
				file = new TextFile(local, TextFile.WriteOnly);
				file.truncate();
				file.write("#include \"" + output.fileName + "\"\n");
				file.close();
			}
			return cmd;
		}
	}
	
	/*Rule {
		inputs: [ "dev_header" ]
		Artifact {
			fileTags: [ "hpp" ]
			fileName: "include/qutim/" + input.fileName
		}
		prepare: {
			var cmd = new JavaScriptCommand();
			cmd.description = "generating header " + output.fileName
			cmd.highlight = 'codegen';
			cmd.sourceCode = function() {
				var file = new TextFile(output.fileName, TextFile.WriteOnly);
				file.truncate();
				file.write("#include \"" + input.fileName + "\"\n");
				file.close();
			}
			return cmd;
		}
	}*/

	files: [
		"version.h.cmake",
		"qutim/abstractcontact.cpp",
		"qutim/abstractcontact.h",
		"qutim/abstractsearchrequest.cpp",
		"qutim/abstractsearchrequest.h",                                                                                                              
		"qutim/abstractsearchrequest_p.h",                                                                                                            
		"qutim/abstractwizardpage.cpp",                                                                                                               
		"qutim/abstractwizardpage.h",                                                                                                                 
		"qutim/account.cpp",                                                                                                                          
		"qutim/account.h",                                                                                                                            
		"qutim/accountmanager.cpp",                                                                                                                   
		"qutim/accountmanager.h",                                                                                                                     
		"qutim/account_p.h",
		"qutim/actionbox.cpp",
		"qutim/actionbox.h",
		"qutim/actionbox_p.h",
		"qutim/actiongenerator.cpp",
		"qutim/actiongenerator.h",
		"qutim/actiongenerator_p.h",
		"qutim/actiontoolbar.cpp",
		"qutim/actiontoolbar.h",
		"qutim/actiontoolbar_p.h",
		"qutim/authorizationdialog.cpp",
		"qutim/authorizationdialog.h",
		"qutim/buddy.cpp",
		"qutim/buddy.h",
		"qutim/buddy_p.h",
		"qutim/chatsession.cpp",
		"qutim/chatsession.h",
		"qutim/chatunit.cpp",
		"qutim/chatunit.h",
		"qutim/chatunit_p.h",
		"qutim/conference.cpp",
		"qutim/conference.h",
		"qutim/configbase.h",
		"qutim/config.cpp",
		"qutim/config.h",
		"qutim/contact.cpp",
		"qutim/contact.h",
		"qutim/contact_p.h",
		"qutim/contactsearch.cpp",
		"qutim/contactsearch.h",
		"qutim/cryptoservice.cpp",
		"qutim/cryptoservice.h",
		"qutim/dataforms.cpp",
		"qutim/dataforms.h",
		"qutim/debug.cpp",
		"qutim/debug.h",
		"qutim/dglobalhotkey.cpp",
		"qutim/dglobalhotkey_p.h",
		"qutim/dynamicpropertydata.cpp",
		"qutim/dynamicpropertydata_p.h",
		"qutim/emoticons.cpp",
		"qutim/emoticons.h",
		"qutim/event.cpp",
		"qutim/event.h",
		"qutim/event_test.cpp",
		"qutim/event_test_p.h",
		"qutim/extensionicon.cpp",
		"qutim/extensionicon.h",
		"qutim/extensioninfo.cpp",
		"qutim/extensioninfo.h",
		"qutim/extensionsearch.cpp",
		"qutim/extensionsearch_p.h",
		"qutim/filetransfer.cpp",
		"qutim/filetransfer.h",
		"qutim/groupchatmanager.cpp",
		"qutim/groupchatmanager.h",
		"qutim/groupchatmanager_p.h",
		"qutim/history.cpp",
		"qutim/history.h",
		"qutim/iconbackend.cpp",
		"qutim/iconbackend_p.h",
		"qutim/icon.cpp",
		"qutim/icon.h",
		"qutim/iconloader.cpp",
		"qutim/iconloader.h",
		"qutim/inforequest.cpp",
		"qutim/inforequest.h",
		"qutim/json.cpp",
		"qutim/jsonfile.cpp",
		"qutim/jsonfile.h",
		"qutim/json.h",
		"qutim/libqutim_global.h",
		"qutim/localizedstring.cpp",
		"qutim/localizedstring.h",
		"qutim/menucontroller.cpp",
		"qutim/menucontroller.h",
		"qutim/menucontroller_p.h",
		"qutim/message.cpp",
		"qutim/message.h",
		"qutim/messagehandler.cpp",
		"qutim/messagehandler.h",
		"qutim/messagesession.h",
		"qutim/metacontact.cpp",
		"qutim/metacontact.h",
		"qutim/metacontactmanager.cpp",
		"qutim/metacontactmanager.h",
		"qutim/metacontactprotocol.cpp",
		"qutim/metacontactprotocol_p.h",
		"qutim/metaobjectbuilder.cpp",
		"qutim/metaobjectbuilder.h",
		"qutim/mimeobjectdata.cpp",
		"qutim/mimeobjectdata.h",
		"qutim/modulemanager.cpp",
		"qutim/modulemanager.h",
		"qutim/modulemanager_p.h",
		"qutim/networkproxy.cpp",
		"qutim/networkproxy.h",
		"qutim/notification.cpp",
		"qutim/notification.h",
		"qutim/objectgenerator.cpp",
		"qutim/objectgenerator.h",
		"qutim/objectgenerator_p.h",
		"qutim/passworddialog.cpp",
		"qutim/passworddialog.h",
		"qutim/personinfo.cpp",
		"qutim/personinfo.h",
		"qutim/plugin.cpp",
		"qutim/plugin.h",
		"qutim/plugin_p.h",
		"qutim/profile.cpp",
		"qutim/profilecreatorpage.cpp",
		"qutim/profilecreatorpage.h",
		"qutim/profile.h",
		"qutim/protocol.cpp",
		"qutim/protocol.h",
		"qutim/protocol_p.h",
		"qutim/qtwin.cpp",
		"qutim/qtwin.h",
		"qutim/rosterstorage.cpp",
		"qutim/rosterstorage.h",
		"qutim/scripttools.cpp",
		"qutim/scripttools.h",
		"qutim/servicemanager.cpp",
		"qutim/servicemanager.h",
		"qutim/servicemanager_p.h",
		"qutim/settingslayer.cpp",
		"qutim/settingslayer.h",
		"qutim/settingslayer_p.h",
		"qutim/settingswidget.cpp",
		"qutim/settingswidget.h",
		"qutim/shortcut.cpp",
		"qutim/shortcut.h",
		"qutim/shortcut_p.h",
		"qutim/sound.cpp",
		"qutim/sound.h",
		"qutim/sound_p.h",
		"qutim/spellchecker.cpp",
		"qutim/spellchecker.h",
		"qutim/startupmodule.cpp",
		"qutim/startupmodule.h",
		"qutim/statisticshelper.cpp",
		"qutim/statisticshelper_p.h",
		"qutim/statusactiongenerator.cpp",
		"qutim/statusactiongenerator.h",
		"qutim/statusactiongenerator_p.h",
		"qutim/status.cpp",
		"qutim/status.h",
		"qutim/systeminfo.cpp",
		"qutim/systeminfo.h",
		"qutim/systemintegration.cpp",
		"qutim/systemintegration.h",
		"qutim/systemintegration_p.h",
		"qutim/tcpsocket.cpp",
		"qutim/tcpsocket.h",
		"qutim/thememanager.cpp",
		"qutim/thememanager.h",
		"qutim/tooltip.cpp",
		"qutim/tooltip.h",
		"qutim/utils.cpp",
		"qutim/utils.h",
		"qutim/varianthook.cpp",
		"qutim/varianthook_p.h",
		"qutim/version.cpp",
		"qutim/widgetactiongenerator.cpp",
		"qutim/widgetactiongenerator.h",
		"qutim/utils/avatarfilter.cpp",
		"qutim/utils/avatarfilter.h",
		"qutim/utils/avatariconengine.cpp",
		"qutim/utils/avatariconengine_p.h",
		"qutim/utils/itemdelegate.cpp",
		"qutim/utils/itemdelegate.h"
	]
}

import qbs.base 1.0

DynamicLibrary {
	name: "libqutim"
	destination: "lib"
	prefix: ""
	property string qutim_version_major: project.qutim_version_major
	property string qutim_version_minor: project.qutim_version_minor
	property string qutim_version_release: project.qutim_version_release
	property string qutim_version_patch: project.qutim_version_patch
	property string qutim_version: project.qutim_version

	//Depends { name: "app_version_header" }
	Depends { name: "k8json" }
	Depends { name: "cpp" }
	Depends { name: "qt"; submodules: [ 'core', 'gui', 'network', 'script' ] }
	cpp.includePaths: [
		path,
		buildDirectory
	]
	
	
	cpp.dynamicLibraries: {
		if (qbs.targetOS == 'linux' || qbs.targetOS == 'freebsd') {
			return [ 'X11' ]
		}
	}
	
	Transformer {
		inputs: [ "version.h.cmake" ]
		Artifact {
			fileName: "libqutim_version.h"
			fileTags: "hpp"
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
			}
			return cmd;
		}
	}
	
	//cpp.includePaths: []
	/*cpp.staticLibraries: {
		if (qbs.targetOS == 'windows') {
			return [
				"advapi32.lib",
				"user32.lib"
			]
		}
	}
	cpp.dynamicLibraries: {
		if (qbs.targetOS == 'linux' || qbs.targetOS == 'freebsd') {
			return ['rt']
		}
	}

	cpp.defines: {
		var result = []
		if (qbs.toolchain == 'msvc2005' || qbs.toolchain == 'msvc2005' || qbs.toolchain == 'msvc2008' || qbs.toolchain == 'msvc2010')
			result.push('BOTAN_DLL=__declspec(dllexport)')
		return result
	}*/

	files: [
		"version.h.cmake",
		"abstractcontact.cpp",
		"abstractcontact.h",
		"abstractsearchrequest.cpp",
		"abstractsearchrequest.h",
		"abstractsearchrequest_p.h",
		"abstractwizardpage.cpp",
		"abstractwizardpage.h",
		"account.cpp",
		"account.h",
		"account_p.h",
		"accountmanager.cpp",
		"accountmanager.h",
		"actionbox.cpp",
		"actionbox.h",
		"actionbox_p.h",
		"actiongenerator.cpp",
		"actiongenerator.h",
		"actiongenerator_p.h",
		"actiontoolbar.cpp",
		"actiontoolbar.h",
		"actiontoolbar_p.h",
		"authorizationdialog.cpp",
		"authorizationdialog.h",
		"buddy.cpp",
		"buddy.h",
		"buddy_p.h",
		"chatsession.cpp",
		"chatsession.h",
		"chatunit.cpp",
		"chatunit.h",
		"chatunit_p.h",
		"conference.cpp",
		"conference.h",
		"config.cpp",
		"config.h",
		"contact.cpp",
		"contact.h",
		"contact_p.h",
		"contactsearch.cpp",
		"contactsearch.h",
		"cryptoservice.h",
		"dataforms.cpp",
		"dataforms.h",
		"debug.cpp",
		"debug.h",
		"dglobalhotkey.cpp",
		"dglobalhotkey.h",
		"dglobalhotkey_p.h",
		"dynamicpropertydata.cpp",
		"dynamicpropertydata.h",
		"dynamicpropertydata_p.h",
		"emoticons.cpp",
		"emoticons.h",
		"event.cpp",
		"event.h",
		"event_test.cpp",
		"event_test.h",
		"event_test_p.h",
		"extensionicon.cpp",
		"extensionicon.h",
		"extensioninfo.cpp",
		"extensioninfo.h",
		"extensionsearch.cpp",
		"extensionsearch.h",
		"extensionsearch_p.h",
		"filetransfer.cpp",
		"filetransfer.h",
		"groupchatmanager.cpp",
		"groupchatmanager.h",
		"groupchatmanager_p.h",
		"history.cpp",
		"history.h",
		"icon.cpp",
		"icon.h",
		"iconbackend.cpp",
		"iconbackend.h",
		"iconbackend_p.h",
		"iconloader.cpp",
		"iconloader.h",
		"inforequest.cpp",
		"inforequest.h",
		"json.cpp",
		"json.h",
		"jsonfile.cpp",
		"jsonfile.h",
		"localizedstring.cpp",
		"localizedstring.h",
		"menucontroller.cpp",
		"menucontroller.h",
		"menucontroller_p.h",
		"message.cpp",
		"message.h",
		"messagehandler.cpp",
		"messagehandler.h",
		"metacontact.cpp",
		"metacontact.h",
		"metacontactmanager.cpp",
		"metacontactmanager.h",
		"metacontactprotocol.cpp",
		"metacontactprotocol.h",
		"metacontactprotocol_p.h",
		"metaobjectbuilder.cpp",
		"metaobjectbuilder.h",
		"mimeobjectdata.cpp",
		"mimeobjectdata.h",
		"modulemanager.cpp",
		"modulemanager.h",
		"modulemanager_p.h",
		"networkproxy.cpp",
		"networkproxy.h",
		"notification.cpp",
		"notification.h",
		"objectgenerator.cpp",
		"objectgenerator.h",
		"objectgenerator_p.h",
		"passworddialog.cpp",
		"passworddialog.h",
		"personinfo.cpp",
		"personinfo.h",
		"plugin.cpp",
		"plugin.h",
		"plugin_p.h",
		"profile.cpp",
		"profile.h",
		"profilecreatorpage.cpp",
		"profilecreatorpage.h",
		"protocol.cpp",
		"protocol.h",
		"protocol_p.h",
		"qtwin.cpp",
		"qtwin.h",
		"rosterstorage.cpp",
		"rosterstorage.h",
		"scripttools.cpp",
		"scripttools.h",
		"servicemanager.cpp",
		"servicemanager.h",
		"servicemanager_p.h",
		"settingslayer.cpp",
		"settingslayer.h",
		"settingslayer_p.h",
		"settingswidget.cpp",
		"settingswidget.h",
		"shortcut.cpp",
		"shortcut.h",
		"shortcut_p.h",
		"sound.cpp",
		"sound.h",
		"sound_p.h",
		"spellchecker.cpp",
		"spellchecker.h",
		"startupmodule.cpp",
		"startupmodule.h",
		"statisticshelper.cpp",
		"statisticshelper.h",
		"statisticshelper_p.h",
		"status.cpp",
		"status.h",
		"statusactiongenerator.cpp",
		"statusactiongenerator.h",
		"statusactiongenerator_p.h",
		"systeminfo.cpp",
		"systeminfo.h",
		"systemintegration.cpp",
		"systemintegration.h",
		"systemintegration_p.h",
		"tcpsocket.cpp",
		"tcpsocket.h",
		"thememanager.cpp",
		"thememanager.h",
		"tooltip.cpp",
		"tooltip.h",
		"utils.cpp",
		"utils.h",
		"varianthook.cpp",
		"varianthook.h",
		"varianthook_p.h",
		"version.cpp",
		"version.h",
		"widgetactiongenerator.cpp",
		"widgetactiongenerator.h"
	]

/*	Group {
		condition: qbs.targetOS == "windows"
		files: [
			"src/entropy/cryptoapi_rng/es_capi.cpp",
		"src/entropy/cryptoapi_rng/es_capi.h",
			"src/entropy/win32_stats/es_win32.cpp",
		"src/entropy/win32_stats/es_win32.h",
			"src/mutex/win32_crit_section/mux_win32.cpp",
		"src/mutex/win32_crit_section/mux_win32.h",
			"src/timer/win32_query_perf_ctr/tm_win32.cpp",
		"src/timer/win32_query_perf_ctr/tm_win32.h",
		]
	}

	Group {
		condition: qbs.targetOS == "linux" || qbs.targetOS == 'mac'
		files: [
			"src/alloc/alloc_mmap/mmap_mem.cpp",
		"src/alloc/alloc_mmap/mmap_mem.h",
			"src/cert/cvc/asn1_eac_str.cpp",
		"src/cert/cvc/asn1_eac_str.h",
			"src/cert/cvc/asn1_eac_tm.cpp",
		"src/cert/cvc/asn1_eac_tm.h",
			"src/cert/cvc/cvc_ado.cpp",
		"src/cert/cvc/cvc_ado.h",
			"src/cert/cvc/cvc_ca.cpp",
		"src/cert/cvc/cvc_ca.h",
			"src/cert/cvc/cvc_cert.cpp",
		"src/cert/cvc/cvc_cert.h",
			"src/cert/cvc/cvc_req.cpp",
		"src/cert/cvc/cvc_req.h",
			"src/cert/cvc/cvc_self.cpp",
		"src/cert/cvc/cvc_self.h",
			"src/cert/cvc/ecdsa_sig.cpp",
		"src/cert/cvc/ecdsa_sig.h",
			"src/cert/cvc/signed_obj.cpp",
		"src/cert/cvc/signed_obj.h",
			"src/entropy/dev_random/es_dev.cpp",
		"src/entropy/dev_random/es_dev.h",
			"src/entropy/egd/es_egd.cpp",
		"src/entropy/egd/es_egd.h",
			"src/entropy/proc_walk/es_ftw.cpp",
		"src/entropy/proc_walk/es_ftw.h",
			"src/entropy/unix_procs/es_unix.cpp",
		"src/entropy/unix_procs/es_unix.h",
			"src/entropy/unix_procs/unix_cmd.cpp",
		"src/entropy/unix_procs/unix_cmd.h",
			"src/entropy/unix_procs/unix_src.cpp",
		"src/entropy/unix_procs/unix_src.h",
			"src/filters/fd_unix/fd_unix.cpp",
		"src/filters/fd_unix/fd_unix.h",
			"src/math/gfpmath/curve_gfp.cpp",
		"src/math/gfpmath/curve_gfp.h",
			"src/math/gfpmath/gfp_element.cpp",
		"src/math/gfpmath/gfp_element.h",
			"src/math/gfpmath/point_gfp.cpp",
		"src/math/gfpmath/point_gfp.h",
			"src/mutex/pthreads/mux_pthr.cpp",
		"src/mutex/pthreads/mux_pthr.h",
			"src/pubkey/ec_dompar/ec_dompar.cpp",
		"src/pubkey/ec_dompar/ec_dompar.h",
			"src/pubkey/ecc_key/ecc_key.cpp",
		"src/pubkey/ecc_key/ecc_key.h",
			"src/pubkey/ecdsa/ecdsa.cpp",
		"src/pubkey/ecdsa/ecdsa.h",
			"src/pubkey/ecdsa/ecdsa_core.cpp",
		"src/pubkey/ecdsa/ecdsa_core.h",
			"src/pubkey/ecdsa/ecdsa_op.cpp",
		"src/pubkey/ecdsa/ecdsa_op.h",
			"src/pubkey/eckaeg/eckaeg.cpp",
		"src/pubkey/eckaeg/eckaeg.h",
			"src/pubkey/eckaeg/eckaeg_core.cpp",
		"src/pubkey/eckaeg/eckaeg_core.h",
			"src/pubkey/eckaeg/eckaeg_op.cpp",
		"src/pubkey/eckaeg/eckaeg_op.h",
			"src/timer/gettimeofday/tm_unix.cpp"
		]
	}*/
}

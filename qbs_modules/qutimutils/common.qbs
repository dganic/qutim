import qbs.base 1.0
import qbs.fileinfo 1.0 as FileInfo

Module {
	property string headersInstallDir: "qutim"

    Rule {
        inputs: [ "devHeaders" ]
        Artifact {
            fileTags: [ "installed_content" ]
            fileName: "include/" + input.modules.qutimutils.headersInstallDir + "/" + input.fileName
        }

        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.sourceCode = function() {
                        File.remove(output.fileName);
                        File.copy(input.fileName, output.fileName);
                    }
            cmd.description = "installing " + FileInfo.fileName(output.fileName);
            cmd.highlight = "linker";
            return cmd;
        }

    }
	
    Rule {
        inputs: ["devHeaders"]
        Artifact {
            fileTags: [ "hpp", "installed_content" ]
            fileName: input.modules.qutimutils.headersInstallDir + "/" + input.fileName
        }

        prepare: {
			var cmd = new JavaScriptCommand();
			cmd.sourceCode = function() {
				var file = new TextFile(output.fileName, TextFile.WriteOnly);
				file.truncate();
				file.write("#include \"" + input.fileName + "\"\n");
				file.close();
			}
			cmd.description = "generating pseudo " + FileInfo.fileName(output.fileName);
            cmd.highlight = "codegen";
            return cmd;
        }

    }
}

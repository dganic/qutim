import qbs.base 1.0
import qbs.fileinfo 1.0 as FileInfo

Product {
	type: "dynamiclibrary"
	destination: "lib/qutim/plugins"
	property string projectPath: project.path
	
	Depends { name: "libqutim" }
	Depends { name: "cpp" }
	
	cpp.defines: [ name.toUpperCase() + "_LIBRARY" ]
	cpp.rpaths: [ "$ORIGIN/../..", "$ORIGIN" ]

	FileTagger {
		pattern: "*.plugin.json"
		fileTags: [ "pluginTemplate" ]
	}	

    Rule {
        inputs: ["pluginTemplate"]
        Artifact {
            fileTags: [ "cpp", "moc_cpp" ]
            fileName: input.baseName + "plugin.cpp"
        }

        prepare: {
			var cmd = new JavaScriptCommand();
			cmd.productName = product.name;
			cmd.templateFilePath = product.projectPath + "/plugins/plugintemplate.cpp";
			cmd.inputFilePath = FileInfo.path(input.fileName);
			cmd.sourceCode = function() {
				var file = new TextFile(input.fileName, TextFile.ReadOnly);
				var data = JSON.parse(file.readAll());
				file = new TextFile(templateFilePath, TextFile.ReadOnly);
				var template = file.readAll();
				var variables = [
					{ from: "productName", to: productName },
					{ from: "pluginIcon", to: data.pluginIcon },
					{ from: "pluginName", to: data.pluginName },
					{ from: "pluginDescription", to: data.pluginDescription },
					{ from: "extensionHeader", to: inputFilePath + "/" + data.extensionHeader },
					{ from: "extensionClass", to: data.extensionClass }
				];
				for (var i = 0; i < variables.length; ++i) {
					var from = variables[i].from;
					var to = variables[i].to || "";
					template = template.replace(new RegExp("\\${" + from + "}", "g"), to);
				}
				file = new TextFile(output.fileName, TextFile.WriteOnly);
				file.truncate();
				file.write(template);
				file.close();
			}
			cmd.description = "generating " + FileInfo.fileName(output.fileName);
            cmd.highlight = "codegen";
            return cmd;
        }

    }
}

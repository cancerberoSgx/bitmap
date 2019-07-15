package bitmap.cli;
class CliMain {
	public static function main() {
		var options = CliUtil.parse(IOUtil.args()).map;
    if(options["help"]!=null){
      printHelp();
      IOUtil.exit(0);
      // Sys.exit(0);
    }
    if(options["input"]==null||options["input"]==""||options["output"]==null||options["output"]==""||options["config"]==null||options["config"]=="") {
      trace("Error: \n--input --output and --config arguments are mandatory.");
      printHelp();
      IOUtil.exit(1);
      // Sys.exit(1);
    }
    var config = haxe.Json.parse(bitmap.IOUtil.readTextFile(options["config"]));
    handleTransformation(config, options);
	}
  static function printHelp(){
    trace("Usage: \nbitmap --input img.png --config effect1.json --output img_out.png");
  }

  static function handleTransformation(config:Dynamic, args:Map<String,String>){
		var bitmap = PNGBitmap.create(IOUtil.readFile(args['input']));
      bitmap.noRangeCheck = true;
      var output:Bitmap;
    if(config.transformation=='pixelize'){
      var width= config.width==null?bitmap.width/10:config.width;
      var height= config.height==null?bitmap.height/10:config.height;
		output = bitmap.transform.pixelize({
			width: Math.round(width),
			height: Math.round(height),
      output:bitmap,
			alpha: 255
		});
    }else {
      throw "Unknown transformation "+config.transformation;
    }
    IOUtil.writeBitmap(args['output'], output);
  }
}

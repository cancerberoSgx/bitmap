package bitmap;

class IOUtil {
  
	public static function readFile(path:String):haxe.io.Input {
		#if js
		untyped var s = require("fs").readFileSync(path);
		var bytes = haxe.io.Bytes.ofData(s);
		return new haxe.io.BytesInput(bytes);
		#else
		return sys.io.File.read("test/assets/n.png", true);
		#end
		throw "Unexpected end of method";
	}

	public static function writeFile(file:String, input:haxe.io.Input) {
		var bytes = input.readAll();
		#if js
		untyped require("fs").writeFileSync(file, Buffer.from(bytes.b));
		return;
		#else
		sys.io.File.saveBytes("test/assets/n.png", bytes);
		return;
		#end
		throw "Unexpected end of method";
	}
}

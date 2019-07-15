package bitmap;

class IOUtil {
	public static function readFile(path:String):haxe.io.Input {
		#if js
		untyped var s = require("fs").readFileSync(path);
		var bytes = haxe.io.Bytes.ofData(s);
		return new haxe.io.BytesInput(bytes);
		#else
		return sys.io.File.read(path, true);
		#end
		throw "Unexpected end of method";
	}

	public static function args() {
		#if js
		untyped return process.argv;
		#else
		return Sys.args();
		#end
		return [];
	}

	public static function exit(code:Int) {
		#if js
		untyped return process.exit(code);
		#else
		return Sys.exit(code);
		#end
	}

	public static function readTextFile(path:String):String {
		#if js
		untyped return require("fs").readFileSync(path).toString();
		#else
		return sys.io.File.getContent(path);
		#end
		return '';
	}

	public static function writeFile(file:String, input:haxe.io.Input) {
		var bytes = input.readAll();
		#if js
		untyped require("fs").writeFileSync(file, Buffer.from(bytes.b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}

	public static function writeBitmap(file:String, bitmap:Bitmap) {
		var output = new haxe.io.BytesOutput();
		bitmap.save(output);
		var bytes = output.getBytes();
		#if js
		untyped require("fs").writeFileSync(file, Buffer.from(bytes.b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}
}

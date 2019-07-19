package bitmap;

class IOUtil {
	public static function fetch(url:String, cb:(error:Dynamic, data:haxe.io.BytesInput) -> Void) {
		fetchResource(url, (error, data) -> {
			if (error != null) {
				cb(error, null);
			} else {
				var bytes = haxe.io.Bytes.ofData(data);
				cb(null, new haxe.io.BytesInput(bytes));
			}
		});
	}

	public static function fetchResource(url:String, cb:(error:Dynamic, data:haxe.io.BytesData) -> Void) {
		#if js
		untyped if ((typeof(window) == 'undefined' || typeof(window.fetch) == 'undefined') && typeof(process) != 'undefined') {
			untyped require('https').get(url, resp -> {
				var data = [];
				resp.on('data', chunk -> {
					data.push(chunk);
				});
				resp.on('end', chunk -> {
					var body = Buffer.concat(data);
					cb(null, body);
					return null;
				});
			}).on("error", (err) -> {
				cb(err, null);
			});
		} else {
			untyped js.Browser.window.fetch(url).then(response -> response.arrayBuffer().then(data -> cb(null, data)));
		}
		#else
		var req = new haxe.Http(url);
		var responseBytes = new haxe.io.BytesOutput();
		req.onError = function(err) {
			cb(err, null);
		};
		req.customRequest(false, responseBytes, null, "GET");
		cb(null, responseBytes.getBytes().getData());
		#end
	}

	public static function readFile(path:String):haxe.io.Input {
		#if js
		untyped var s = require('fs').readFileSync(path);
		var bytes = haxe.io.Bytes.ofData((cast s));
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
		untyped return require('fs').readFileSync(path).toString();
		#else
		return sys.io.File.getContent(path);
		#end
		return '';
	}

	public static function writeFile(file:String, input:haxe.io.Input) {
		var bytes = input.readAll();
		#if js
		untyped require('fs').writeFileSync(file, Buffer.from(cast bytes.b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}

	public static function writeTextFile(path:String, s:String) {
		#if js
		untyped require('fs').writeFileSync(path, s);
		#else
		sys.io.File.write(path).writeString(s);
		#end
	}

	public static function writeBitmap(file:String, bitmap:Bitmap) {
		var output = new haxe.io.BytesOutput();
		bitmap.save(output);
		var bytes = output.getBytes();
		#if js
		untyped require('fs').writeFileSync(file, Buffer.from((cast bytes).b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}
}

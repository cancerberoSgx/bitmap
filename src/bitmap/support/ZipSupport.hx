package bitmap.support;

import bitmap.*;
import bitmap.support.Pako;

class ZipSupport {
	private static var haxeZipCompressJsSupportOnce = false;

	public static function haxeZipCompressJsSupport() {
		#if js
    	if (haxeZipCompressJsSupportOnce) {
			return;
		}
		haxeZipCompressJsSupportOnce = true;
		// pako.min.js is embedded as a string variable so we can eval() it:
		var pakoJs = Pako.js;
		untyped eval(pakoJs);
		// Just overriding haxe.zip.Compress.run will allow format.png.Writter to work:
		untyped haxe.zip.Compress.run = function(bytes, level = 9) {
			var data = bytes.getData();
			var data = untyped pako.deflate(data, {level: level});
			return haxe.io.Bytes.ofData(data);
		};
		#end
	}
}

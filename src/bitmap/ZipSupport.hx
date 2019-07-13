package bitmap;

class ZipSupport {
  private static var haxeZipCompressJsSupportOnce = false;

	public static function haxeZipCompressJsSupport() {
		if (haxeZipCompressJsSupportOnce) {
			return;
		}
		haxeZipCompressJsSupportOnce = true;
		#if js
		untyped haxe.zip.Compress.run = function(bytes, level = 9) {
			var data = bytes.getData();
			var data = untyped pako.deflate(data, {level: level});
			return haxe.io.Bytes.ofData(data);
		};
		#end
	}
}
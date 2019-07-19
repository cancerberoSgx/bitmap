class Util {
	public static function fetchResource(url: String, cb: (data:haxe.io.BytesData)-> Void) {
		untyped bitmapFetchResource(url, cb);
	}
}
package bitmap;

import bitmap.*;

/**
 * Utilities to load/save bitmaps from/to other formats or resources, such as base64 dataUrls, raw bytes formats, HTML canvas, HTML images, DOM Blobs, TypedArrays, buffers, urls, etc.
**/
@:expose class BitmapIO {
	private var bitmap:Bitmap;

	public function new(b:Bitmap) {
		bitmap = b;
	}

	/** Creates a DataUrl like `data:image/png;name=f.png;base64,` using given base64 content, mimeType and fileName. **/
	public function toDataUrl(?mime:String = 'image/png', ?name:String) {
		return BitmapUtil.toDataUrl(bitmap, mime, name);
	}

	/** Returns base64 representation of this image in an ecoded format like PNG  **/
	public function toBase64() {
		return BitmapUtil.toBase64(bitmap);
	}

	/** Loads bitmap from given base64 string. **/
	public function fromBase64(base64:String) {
		return BitmapUtil.fromBase64(base64, bitmap);
	}

	/** Loads bitmap from given data url string. **/
	public function fromDataUrl(dataurl:String) {
		return BitmapUtil.fromDataUrl(dataurl, bitmap);
	}

	#if js
	/**
	 * Loads bitmaps from files in html input element of type "file"
	 */
	public static function readHtmlInputFile(el:js.html.InputElement):js.lib.Promise<Array<Bitmap>> {
		return js.lib.Promise.all([for (file in el.files) file].map(file -> (new js.lib.Promise((resolve, reject) -> {
				var reader = new js.html.FileReader();
				reader.addEventListener('loadend', e -> resolve(new js.lib.Uint8Array(reader.result)));
				reader.readAsArrayBuffer(file);
			})))).then(contents -> contents.map(content -> {
				var bytes = haxe.io.Bytes.ofData(content);
				var input = new haxe.io.BytesInput(bytes);
				var bitmap = new PNGBitmap();
				bitmap.load(input);
				return cast(bitmap, Bitmap);
			}));
	}
	#end

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

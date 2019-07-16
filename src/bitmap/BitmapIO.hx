package bitmap;

import bitmap.*;

/**
 * Utilities to load/save bitmaps from/to other formats or resources, such as base64 dataUrls, raw bytes formats, HTML canvas, HTML images, DOM Blobs, TypedArrays, buffers, urls, etc.
**/
class BitmapIO {
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
}
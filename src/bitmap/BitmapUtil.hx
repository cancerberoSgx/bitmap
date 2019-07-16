package bitmap;

import bitmap.*;

class BitmapUtil {
	public static function bitmapEquals(a:Bitmap, b:Bitmap, ?region:Types.Rectangle) {
		if (a.width != b.width || a.height != b.height) {
			return false;
		}
		if (region == null) {
			region = {
				x: 0,
				y: 0,
				width: Util.min(a.width, b.width),
				height: Util.min(a.height, b.height)
			};
		}
		return a.data.compare(b.data) == 0;
		// for (y in 0...a.height) {
		// 	for (x in 0...a.width) {
		// 		var c1 = a.get(x, y);
		// 		var c2 = b.get(x, y);
		// 		if (!ColorUtil.colorEquals(c1, c2)) {
		// 			return false;
		// 		}
		// 	}
		// }
		// return true;
	}

	/**
		* Compares given region of given Bitmaps. Returns a number between -1 and 1, the biger its absolute value the bigger the difference. If negative it means the sum of a's bytes is bigger than b's, possitive otherwise.

		   TODO : fix this is not working fine
	**/
	public static function compare(a:Bitmap, b:Bitmap, ?regionA:Types.Rectangle, ?regionB:Types.Rectangle) {
		if (regionA == null && regionB == null && (a.width != b.width || b.height != a.height)) {
			throw "No regions given and bitmaps with different sizes";
		}
		regionA = regionA == null ? (regionB == null ? a.bounds() : regionB) : regionA;
		regionB = regionB == null ? (regionA == null ? b.bounds() : regionA) : regionB;
		if (regionA.width != regionB.width || regionA.height != regionB.height) {
			throw "Regions given or inferred have different sizes";
		}
		var va = 0, vb = 0;
		var startA = (cast a).byteIndex(regionA.x, regionA.y);
		var endA = (cast a).byteIndex(regionA.x + regionA.width, regionA.y + regionA.height);
		var startB = (cast a).byteIndex(regionB.x, regionB.y);
		var endB = (cast a).byteIndex(regionB.x + regionB.width, regionB.y + regionB.height);
		Sure.sure(endA - startA == endB - startB);
		Sure.sure(endA > startA && endB > startB);
		Sure.sure(startA >= 0 && startB >= 0);
		Std.int(1);
		for (i in 0...endA - startA) {
			var v = a.data.get(startA + i);
			va += Math.isNaN(v) ? 0 : v;
			v = b.data.get(startB + i);
			vb += Math.isNaN(v) ? 0 : v;
		}
		return Util.dist(va, vb) / ((endA - startA) * 255) * (va > vb ? -1 : 1);
	}

	public static function blend(b1:Bitmap, b2:Bitmap, b3:Bitmap, ?blend:Types.ColorBlend) {
		var w = Util.min(b1.width, b2.width);
		var h = Util.min(b1.height, b2.height);
		for (y in 0...h) {
			for (x in 0...w) {
				b3.set(x, y, ColorUtil.blendColors(b1.get(x, y), b2.get(x, y), blend));
			}
		}
		return b3;
	}

	/** Creates a DataUrl like `data:image/png;name=f.png;base64,` using given base64 content, mimeType and fileName. **/
	public static function toDataUrl(bitmap:Bitmap, ?mime:String = 'image/png', ?name:String) {
		var b64 = toBase64(bitmap);
		return 'data:' + mime + ';'+(name == null ? '' : (name + ';')) + 'base64,' + b64;
	}

  /** Returns base64 representation of this image in an ecoded format like PNG  **/
	public static function toBase64(bitmap:Bitmap) {
		var ii = new haxe.io.BytesOutput();
	bitmap.save(ii);
		var bytes = ii.getBytes();
		return haxe.crypto.Base64.encode(bytes);
	}

  /** Loads bitmap from given base64 string. **/
	public static function fromBase64(base64:String, ?bitmap:Bitmap) {
    bitmap = bitmap==null?new PNGBitmap():bitmap;
		var bytes = haxe.crypto.Base64.decode(base64);
		var ii = new haxe.io.BytesInput(bytes);
		bitmap.load(ii);
    return bitmap;
	}

  /** Loads bitmap from given data url string. **/
	public static function fromDataUrl(dataurl:String, ?bitmap:Bitmap) {
    var base64 = Util.urlToBase64(dataurl);
    return fromBase64(base64, bitmap);
	}
}

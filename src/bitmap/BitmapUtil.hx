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
	**/
	public static function compare(a:Bitmap, b:Bitmap, region:Types.Rectangle) {
		var va = 0, vb = 0;
		var start = (cast a).byteIndex(region.x, region.y);
		var end = (cast a).byteIndex(region.x + region.width, region.y + region.height);
		for (i in start...end) {
			va += a.data.get(i);
			vb += b.data.get(i);
		}
		return Util.dist(va, vb) / ((end - start)*255) * (va > vb ? -1 : 1);
	}

	public static function blendBitmaps(b1:Bitmap, b2:Bitmap, b3:Bitmap, ?mode:Types.Blend) {
		var w = Util.min(b1.width, b2.width);
		var h = Util.min(b1.height, b2.height);
		for (y in 0...h) {
			for (x in 0...w) {
				var c = ColorUtil.blendColors(b1.get(x, y), b2.get(x, y), mode);
				b3.set(x, y, c);
			}
		}
		return b3;
	}
}

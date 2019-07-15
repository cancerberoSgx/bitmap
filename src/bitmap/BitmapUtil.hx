package bitmap;

import bitmap.*;

class BitmapUtil {

	public static function bitmapEquals(a:Bitmap, b:Bitmap, ?debug:Bool) {
		if (a.width != b.width || a.height != b.height) {
			return false;
		}
    return a.data.compare(b.data)==0;
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

package bitmap;

import bitmap.*;

class BitmapUtil {
	public static inline function colorEquals(a:bitmap.Color, b:bitmap.Color) {
		return a == b;
	}

	public static function bitmapEquals(a:Bitmap, b:Bitmap) {
    // for(i in 0...a.data.length) {
    // for(j in 0...a.data.length){
    //   if(i!=j){
    //     return false;
    //   }
    // }
    // }
		for (y1 in 0...a.height) {
			for (x1 in 0...a.width) {
				var c1 = a.get(x1, y1);

				// for (y2 in 0...b.height) {
					// for (x2 in 0...b.width) {
						var c2 = a.get(x1, y1);
						if (!colorEquals(c1, c2)) {
							return false;
						}
					// }
				// }
			}
		}
		return true;
	}

	public static function drawRectangle(b:Bitmap, r:Rectangle, c:bitmap.Color) {
		for (y in 0...r.height) {
			for (x in 0...r.width) {
				b.set(x + r.x, y + r.y, c);
			}
		}
	}
}

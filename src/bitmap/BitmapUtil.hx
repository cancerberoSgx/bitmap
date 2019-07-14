package bitmap;

import bitmap.*;

class BitmapUtil {
	public static inline function colorEquals(a:bitmap.Color, b:bitmap.Color) {
		return a.r == b.r && a.g == b.g && a.b == b.b && a.a == b.a;
	}

	public static function bitmapEquals(a:Bitmap, b:Bitmap, ?debug:Bool) {
		if (a.width != b.width || a.height != b.height) {
			return false;
		}
		for (y in 0...a.height) {
			for (x in 0...a.width) {
				var c1 = a.get(x, y);
				var c2 = b.get(x, y);
				if (!colorEquals(c1, c2)) {
					return false;
				}
			}
		}
		return true;
	}

	public static function drawRectangle(b:Bitmap, x:Int, y:Int, width:Int, height:Int, c:bitmap.Color, ?fill:Bool, ?blend:Types.Blend) {
		b.draw.rectangle({
			x: x,
			y: y,
			width: width,
			height: height,
			c: c,
			fill: fill,
			blend: blend
		});
	}

	public static function drawLine(bitmap:Bitmap, x1:Int, y1:Int, x2:Int, y2:Int, c:Color, ?blend:Types.Blend) {
		bitmap.draw.line(x1, y1, x2, y2, c, blend);
	}

	public static function blendBitmaps(b1:Bitmap, b2:Bitmap, ?b3:Bitmap, ?mode:Types.Blend) {
		var w = Util.min(b1.width, b2.width);
		var h = Util.min(b1.height, b2.height);
		b3 = b3 == null ? b1 : b3;
		for (y in 0...h) {
			for (x in 0...w) {
				var c = blendColors(b1.get(x, y), b2.get(x, y), mode);
				b3.set(x, y, c);
			}
		}
		return b3;
	}

	public static function blendColors(c1:Color, c2:Color, ?mode:Types.Blend) {
		if (mode == Types.Blend.alpha) {
			return c2;
		} else if (mode == Types.Blend.mean) {
			return Color.create(Std.int((c1.r + c2.r) / 2), Std.int((c1.g + c2.g) / 2), Std.int((c1.b + c2.b) / 2), Std.int((c1.a + c2.a) / 2));
		} else {
			return c2;
		}
	}
}

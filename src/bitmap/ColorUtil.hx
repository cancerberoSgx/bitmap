package bitmap;

import bitmap.*;

class ColorUtil {
	public static inline function colorEquals(a:bitmap.Color, b:bitmap.Color) {
		return a.r == b.r && a.g == b.g && a.b == b.b && a.a == b.a;
	}

	/**
	 * Computes the average RGB color of the pixels in the image.
	 * @param	image	The image whose average color will be calculated.
	 * @param	alpha	The opacity of the image (0-255), defaults to opaque (255).
	 * @return	The average RGB color of the image, RGBA8888 format. Alpha defaults to opaque (255).
	 */
	public static function average(image:Bitmap, ?region:Types.Rectangle, ?alpha:Int):Color {
		Sure.sure(image != null);
		// TODO: verify valid region

		var totalRed:Int = 0;
		var totalGreen:Int = 0;
		var totalBlue:Int = 0;
		var totalAlpha:Int = 0;
		if (region == null) {
			region = {
				x: 0,
				y: 0,
				width: image.width,
				height: image.height
			};
		}
		for (x in region.x...region.x + region.width) {
			for (y in region.y...region.y + region.height) {
				var pixel = image.get(x, y);
				totalRed += pixel.r;
				totalGreen += pixel.g;
				totalBlue += pixel.b;
				totalAlpha += pixel.a;
			}
		}
		var size:Int = region.width * region.height;
		return Color.create(Std.int(Math.round(totalRed / size)), Std.int(Math.round(totalGreen / size)), Std.int(Math.round(totalBlue / size)),
			alpha == null ? Std.int(Math.round(totalAlpha / size)) : alpha);
	}

	public inline static function random(?alpha:Int) {
		return Color.create(Util.random(0, 255), Util.random(0, 255), Util.random(0, 255), alpha==null?Util.random(0, 255):alpha);
	}
	public inline static function randomGray(?alpha:Int) {
    var g=Util.random(0, 255);
		return Color.create(g, g, g, alpha==null?Util.random(0, 255):alpha);
	}
	public inline static function blendColors(c1:Color, c2:Color, ?mode:Types.Blend) {
		if (mode == Types.Blend.alpha) {
			return c2;
		} else if (mode == Types.Blend.mean) {
			return Color.create(Std.int((c1.r + c2.r) / 2), Std.int((c1.g + c2.g) / 2), Std.int((c1.b + c2.b) / 2), Std.int((c1.a + c2.a) / 2));
		} else {
			return c2;
		}
	}
}

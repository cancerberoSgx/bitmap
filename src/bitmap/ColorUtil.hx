package bitmap;

import bitmap.*;

class ColorUtil {
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

	public static function random() {
		return Color.create(Util.random(0, 255), Util.random(0, 255), Util.random(0, 255), Util.random(0, 255));
	}
}

package bitmap;

import bitmap.*;

/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
typedef ColorFilter = {
	@:optional var red:ColorFilterChannel;
	@:optional var green:ColorFilterChannel;
	@:optional var blue:ColorFilterChannel;
	@:optional var alpha:ColorFilterChannel;
  /**
   * filter declarations by providing a function `fn` that transform colors to colors
   **/
	@:optional var fn:(c: Color) ->  Color;
  @:optional var ?blend:Types.ColorBlend;
};

/** Linear transformation on channels (a * value + c). **/
typedef ColorFilterChannel = {
	var c:Float;
	var a:Float;
}

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
		return Color.create(Util.random(0, 255), Util.random(0, 255), Util.random(0, 255), alpha == null ? Util.random(0, 255) : alpha);
	}

	public inline static function randomGray(?alpha:Int) {
		var g = Util.random(0, 255);
		return Color.create(g, g, g, alpha == null ? Util.random(0, 255) : alpha);
	}

	/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
	public inline static function blendColors(c1:Color, c2:Color, ?blend:Types.ColorBlend) {
		blend = blend == null ? {type: Types.Blend.mean, factor: 0.5} : blend;
		blend.factor = blend.factor == null ? 0.5 : blend.factor;
		if (blend.type == Types.Blend.alpha) {
			return c2;
		} else if (blend.type == Types.Blend.mean) {
			return Color.create(Std.int(c1.r * blend.factor + c2.r * (1 - blend.factor)), Std.int(c1.g * blend.factor + c2.g * (1 - blend.factor)),
				Std.int(c1.b * blend.factor + c2.b * (1 - blend.factor)), Std.int(c1.a * blend.factor + c2.a * (1 - blend.factor)));
		} else {
			return c2;
		}
	}

  public function mix(c1: Color, c2:Color, strength:Float):Color
	{
		var output:Color = new Color(0);
		output.r = Math.floor((c1.r * (1 - strength)) + (c2.r * strength));
		output.g = Math.floor((c1.g * (1 - strength)) + (c2.g * strength));
		output.b = Math.floor((c1.b * (1 - strength)) + (c2.b * strength));
		output.a = Math.floor((c1.a * (1 - strength)) + (c2.a * strength));
		return output;
	}
	/**
	 * Supports filter declarations by providing a function `fn` that transform colors to colors, or if not given, alternatively it supports providing 1-grade equation coeficients to transform each channel linearly (red*a+c).
	**/
	public inline static function filter(c:Color, o:ColorFilter): Color {
    var c2 : Color; 
		if (o.fn != null) {
			c2= o.fn(c);
		}
    else {
		o.red = o.red == null ? {a: 1.0, c: 0.0} : o.red;
		o.green = o.green == null ? {a: 1.0, c: 0.0} : o.green;
		o.blue = o.blue == null ? {a: 1.0, c: 0.0} : o.blue;
		o.alpha = o.alpha == null ? {a: 1.0, c: 0.0} : o.alpha;
     c2 = Color.create(Math.round(c.r * o.red.a + o.red.c), Math.round(c.g * o.green.a + o.green.c), Math.round(c.b * o.blue.a + o.blue.c),
			Math.round(c.a * o.alpha.a + o.alpha.c));
    }
		return o.blend==null?c2 : blendColors(c, c2, o.blend);
	}
}

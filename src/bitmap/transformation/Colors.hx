package bitmap.transformation;

import bitmap.ColorUtil.ColorFilter;
import bitmap.*;
import bitmap.transformation.*;

using bitmap.support.StructureTools;

@:expose typedef ColorBlendOptions = {
	> ColorFilterOptions,
  var bitmap2:Bitmap;
};

@:expose typedef SepiaFilterOptions = {
	> ColorFilterOptions,
	@:optional var sepiaIntensity:Int;
};

/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
@:expose typedef ColorFilterOptions = {
	> Transform.TransformationOptions,
	> ColorUtil.ColorFilter,
};

@:expose class Colors {
	private var bitmap:Bitmap;

	public function new(b:Bitmap) {
		bitmap = b;
	}

	public function blend(o:ColorBlendOptions) {
		throw "todo";
	}

	/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
	public function filter(o:ColorFilterOptions) {
		o.bitmap = o.bitmap == null ? bitmap : o.bitmap;
		var output = o.output == null ? o.bitmap.clone() : o.output;
		var region = o.region == null ? output.bounds() : o.region;
		for (y in region.y...region.height) {
			for (x in region.x...region.width) {
				var c = o.bitmap.get(x, y);
        o.x=x;
        o.y=y;
				var c2 = ColorUtil.filter(c, o);
				output.set(x, y, c2);
			}
		}
		return output;
	}

	/** transform each channel to the closer gray to each of them. **/
	public function grayScale(?o:ColorFilterOptions) {
		o = o == null ? {bitmap: bitmap} : o;
		var o2 = (o == null ? {bitmap: bitmap} : o).combine({
				fn: (c:Color,  ?o:ColorFilter) -> {
					var gray = Math.round((c.r + c.g + c.b) / 3);
					return Color.create(gray, gray, gray, c.a);
				}
			});
		return filter(o2);
	}

	public function sepia(?o:SepiaFilterOptions) {
		o = o == null ? {bitmap: bitmap, sepiaIntensity: 30} : o;
		var fn = (c:Color, ?o2: ColorFilter) -> {
			// Play around with this.  20 works well and was recommended  by another developer. 0 produces black/white image
			var sepiaDepth = 20;
			//  From 0-255, 30 produces nice results
			var sepiaIntensity = o.sepiaIntensity == null ? 30 : o.sepiaIntensity;
			var gray = (c.r + c.g + c.b) / 3;
			var r = gray, g = gray, b = gray;
			r = r + (sepiaDepth * 2);
			g = g + sepiaDepth;
			if (r > 255)
				r = 255;
			if (g > 255)
				g = 255;
			if (b > 255)
				b = 255;
			// Darken blue color to increase sepia effect
			b -= sepiaIntensity;
			// normalize if out of bounds
			if (b < 0)
				b = 0;
			if (b > 255)
				b = 255;
			return Color.create(Math.round(r), Math.round(g), Math.round(b), c.a);
		};
		return filter((o == null ? {bitmap: bitmap} : o).combine({fn: fn}));
	}
	//   private static function toTone(c:Color, tone:Color, tmax:Int, tmin:Int){
	//     // var e = Util.minMaxElements([c.r, c.g, c.b ]);
	//     // var v = Math.round((e.max));
	//     // inline function f(c:Int, t:Int){
	//     //   var t1= e.max/2*c
	//     // }
	// var gray = (c.r+c.g+c.b)/3;
	//       return Math.round(gray);
	//     // }
	//   }
	// public function tone(o:  ToneFilterOptions) {
	//   var t = Util.minMaxElements([o.tone.r, o.tone.g, o.tone.b ]);
	// //  return filter(cast (o.combine(o, {fn:c->toTone(c, Color.create(255-t.max+o.tone.r, 255-t.max+o.tone.g,255-t.max+o.tone.b,  255) , t.max)})));
	//  return filter(cast (o.combine(o, {fn:c->toTone(c, o.tone, t.max, t.min)})));//Color.create(Math.round((t.max+o.tone.r)/2), Math.round((t.max+o.tone.g)/2),Math.round((t.max+o.2to/ne).b),  255) , t.max)})));
	// }
}

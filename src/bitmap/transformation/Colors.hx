package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;
using bitmap.support.StructureTools;

typedef ColorBlendOptions = {
	> ColorFilterOptions,
};

typedef GrayScaleFilterOptions = {
	> ColorFilterOptions,
};

/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
typedef ColorFilterOptions = {
	> Transform.TransformationOptions,
	> ColorUtil.ColorFilter,
};
 

class Colors {
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
				var c2 = ColorUtil.filter(c, o);
				output.set(x, y, c2);
			}
		}
		return output;
	}

	/** Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) . **/
	public function grayScale(o:  GrayScaleFilterOptions) {
   var fn = function(c:Color){
      var e = Util.minMaxElements([c.r, c.g, c.b, c.a]); 
      var v = Math.round((e.max-e.min)/2);
      return Color.create(v,v,v,v);
    }
		return filter(o.combine({fn:fn}));
	}

}

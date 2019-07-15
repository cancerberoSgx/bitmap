package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

typedef ColorBlendOptions = {
	> Transform.TransformationOptions,
	@:optional var blend:Types.ColorBlend;
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
}

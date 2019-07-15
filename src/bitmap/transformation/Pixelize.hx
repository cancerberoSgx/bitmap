package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

using bitmap.support.StructureTools;

class Pixelize {
	public function new() {}

	public function transform(t:PixelizeOptions) {
		var b = t.output!=null ? t.output : t.bitmap.clone();
		var a = t.bitmap;
		var xStep = Std.int(Math.round(a.width / t.width));
		var yStep = Std.int(Math.round(a.height / t.height));
		for (x in 0...t.width) {
			for (y in 0...t.height) {
				var minXStep = xStep * x + xStep >= b.width ? b.width - 1 - xStep * x : xStep;
				var minYStep = yStep * y + yStep >= b.height ? b.height - 1 - yStep * y : yStep;

				var region = {
					x: xStep * x,
					y: yStep * y,
					width: minXStep,
					height: minYStep
				};
				var c = ColorUtil.average(a, region, t.alpha);
				var r = region.combine({c: c, fill: true, blend: t.blend});
				b.draw.rectangle(r.combine({
						x: xStep * x,
						y: yStep * y,
						width: minXStep,
						height: minYStep
					}));
			}
		}
		return b;
	}
}

typedef PixelizeOptions = {
	> Transform.TransformationOptions,
	var width:Int;
	var height:Int;

	/**
	 * If provided, it will blend rectangles with averge color on top of resulting pixels, with given alpha.
	**/
	@:optional var alpha:Int;
	@:optional var blend:Types.Blend;
}

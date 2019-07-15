package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

using bitmap.support.StructureTools;

typedef PixelizeOptions = {
	> Transform.TransformationOptions,
	var width:Int;
	var height:Int;
	@:optional var blend:Types.ColorBlend;

	/**
	 * If provided, it will blend rectangles with averge color on top of resulting pixels, with given alpha.
	**/
	@:optional var alpha:Int;
}

class Pixelize {
	public function new() {}

	public function transform(t:PixelizeOptions) {
		var b = t.output != null ? t.output : t.bitmap.clone();
		var a = t.bitmap;

		var region2 = t.region == null ? a.bounds() : t.region;
		// for (y in region2.y...region2.height) {
		// 	for (x in region2.x...region2.width) {
		var xStep = Std.int(Math.round(region2.width / t.width));
		var yStep = Std.int(Math.round(region2.height / t.height));
		for (x in 0...t.width) {
			for (y in 0...t.height) {
				var minXStep = xStep * x + xStep >= region2.width ? region2.width - 1 - xStep * x : xStep;
				var minYStep = yStep * y + yStep >= region2.height ? region2.height - 1 - yStep * y : yStep;

				var region = {
					x: xStep * x + region2.x,
					y: yStep * y + region2.y,
					width: minXStep,
					height: minYStep
				};
				var c = ColorUtil.average(a, region, t.alpha);
				var r = region.combine({c: c, fill: true, blend: t.blend});
				b.draw.rectangle(r.combine({
						x: xStep * x + region2.x,
						y: yStep * y + region2.y,
						width: minXStep,
						height: minYStep
					}));
			}
		}
		return b;
	}
}

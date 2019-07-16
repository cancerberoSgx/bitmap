package bitmap.text;

import bitmap.text.Types.RenderOptions;
import bitmap.text.*;

using bitmap.support.StructureTools;

class Renderer {
	var glyphs:Map<String, Map<Int, Bitmap>>;
	var manager:FontManager;

	public function new(manager_:FontManager) {
		manager = manager_;
		glyphs = new Map();
	}

	// public function render(o:RenderOptions) {
	// 		var x = 0, y = 0;
	// 	// 	for (s in 'seba'.split('')) {
	// 	// 		var cc = chars[s];
	// 	// 		o.copyFrom(cc, {x: 0, y: 0}, {
	// 	// 			x: x,
	// 	// 			y: y,
	// 	// 			width: cc.width,
	// 	// 			height: cc.height
	// 	// 		});
	// 	// 		x += cc.width;
	// 	// 	}
	// }
	public function render(o:RenderOptions) {
		var font = manager.getFont(o.fontFamily);
		var output = o.output == null ? o.bitmap.clone() : o.output;

		// TODO dictionary for glyphs - extract only  one time

		var x = o.x, y = o.y;
		var a = o.text.split('');
		for (i in 0...a.length) {
			var glyph = o.font.getGlyphByString(a[i]);
			if (glyph != null && o.throwOnGlyphNotFound) {
				throw 'Glyph not found for font ${o.fontFamily} and character ${a[i]}';
			}
			// TODO: check region, add new lines verify end of bitmap horizotal and certical, Impement align, justify and word wrap.
			output.copyFrom(glyph.bitmap, {x: 0, y: 0}, {
				x: x,
				y: y,
				width: glyph.width,
				height: glyph.height
			});
			x += glyph.width;
			// y += glyph.height;
			// var s = String.fromCharCode(Std.parseInt(c.id));
			// var charBitmap = fonnt.chars
			// var charBitmap = fonnt.cj

			// var charImg = new PNGBitmap();
			// var cBitmap = font.copyFrom({x: 0, y: 0, width: }, {
			// 	x: x,
			// 	y: y,
			// 	width: cc.width,
			// 	height: cc.height
			// });
			// x += cc.width;
		}
    return {bitmap: output};
	}
}

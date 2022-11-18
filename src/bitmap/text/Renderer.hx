package bitmap.text;

import bitmap.text.Types.RenderOptions;
import bitmap.text.*;

using Lambda;

class Renderer {
	var glyphs:Map<String, Map<Int, Bitmap>>;
	var manager:FontManager;

	public function new(manager_:FontManager) {
		manager = manager_;
		glyphs = new Map();
	}

	public function render(o:RenderOptions) {
		var output = o.output == null ? o.bitmap.clone() : o.output;

		// TODO dictionary for glyphs - extract only  one time

		var x = o.x, y = o.y;
		var a = o.text.split('');
		for (i in 0...a.length) {
			var glyph = o.font.getGlyphByString(a[i]);
			if (glyph == null) {
				if (o.throwOnGlyphNotFound)
					throw 'Glyph not found for font ${o.fontFamily} and character ${a[i]}'
				else
					continue;
			}

			// TODO: check region, add new lines verify end of bitmap horizotal and certical, Impement align, justify and word wrap.
			output.insertWithTransparency(glyph.bitmap, {x: 0, y: 0}, {
				x: x + glyph.xoffset,
				y: y + glyph.yoffset,
				width: glyph.width,
				height: glyph.height,
			});
			x += glyph.xadvance;
		}
		return {bitmap: output};
	}

	/**
		Returns the width the text will take up when rendered
	**/
	public function getWidth(font: Font, text: String, throwOnGlyphNotFound: Bool) {
		return text.split('').fold(
			(item, carry) -> {
				var glyph = font.getGlyphByString(item);
				return if (glyph == null)
					if (throwOnGlyphNotFound)
						throw 'Glyph not found for font ${font.fontFamiliy} and character ${item}'
					else
						carry
				else
					carry + glyph.xadvance;
			},
			0
		);
	}
}

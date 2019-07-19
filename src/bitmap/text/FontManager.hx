package bitmap.text;

import bitmap.text.Types.RenderTextOptions;
import bitmap.text.Types.Glyph;
import bitmap.text.Types.CharDef;

using bitmap.support.StructureTools;

class FontManager {
	private var renderer:Renderer;

	private function new() {
		fonts = new Map<String, Font>();
		renderer = new Renderer(this);
	}

	private static var instance:FontManager;

	private var fonts:Map<String, Font>;

	public static function getInstance() {
		if (instance == null) {
			instance = new FontManager();
		}
		return instance;
	}

	public function getFont(fontFamily:String) {
		var font = fonts[fontFamily];
		if (font == null) {
			throw "Font not registered: ";
		}
		return font;
	}

	private function parseFont(def:Types.FontDef) {
		var fmtString = def.fmt.readAll().toString();
		var xml = haxe.xml.Parser.parse(fmtString).firstElement();
		var chars:Array<CharDef> = [];
		var chars:Map<Int, CharDef> = new Map();
		for (char in xml.elementsNamed('chars').next().elementsNamed('char')) {
			var id = Util.parseIntOrThrow(char.get('id'));
			var text = String.fromCharCode(id);
			var c = {
				id: id,
				text: text,
				x: Util.parseIntOrThrow(char.get('x')),
				y: Util.parseIntOrThrow(char.get('y')),
				width: Util.parseIntOrThrow(char.get('width')),
				height: Util.parseIntOrThrow(char.get('height')),
				xoffset: Util.parseIntOrThrow(char.get('xoffset')),
				yoffset: Util.parseIntOrThrow(char.get('yoffset')),
				xadvance: Util.parseIntOrThrow(char.get('xadvance')),
			};
			chars[c.id] = c;
		}
		return chars;
	}

	private function buildGlyps(chars:Map<Int, CharDef>, b:Bitmap):Map<Int, Glyph> {
		var glyps:Map<Int, Glyph> = new Map();
		for (c in chars.iterator()) {
			glyps[c.id] = {bitmap: b.copy(c)}.combine(c);
		}
		return glyps;
	}

	public function registerFont(def:Types.FontDef) {
		if (fonts[def.fontFamily] != null) {
			throw "Font already registered";
		}
		var chars = parseFont(def);
		var bitmap = new PNGBitmap();
		bitmap.load(def.img);
		var glyps = buildGlyps(chars, bitmap);

		var font = new Font(def.fontFamily, glyps, bitmap);

		fonts[def.fontFamily] = font;
		return font;
	}

	public function render(o:RenderTextOptions) {
		var font = fonts[o.fontFamily];
		var o2 = o.combine({
			font: font
		});
		return renderer.render(o2);
	}
}

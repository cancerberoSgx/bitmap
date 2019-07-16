package bitmap.text;
import bitmap.text.Types.Glyph;
import bitmap.text.Types.CharDef;
import bitmap.text.FontManager.*;

class Font {
	private var glyps:Map<Int, Glyph>;
	private var bitmap:Bitmap;
 var fontFamiliy:String;
	public function new(fontFamiliy_:String, glyps_:Map<Int, Glyph> , img:Bitmap) {
		glyps = glyps_;
		bitmap = img;
    fontFamiliy=fontFamiliy_;
	}
  public function getGlyph(id:Int):Glyph {
    return glyps[id];
  }
  public function getGlyphByString(s:String):Glyph {
    return glyps[s.charCodeAt(0)];
  }
}
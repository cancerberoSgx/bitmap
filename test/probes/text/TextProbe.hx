package probes.text;
import haxe.ds.Map;
import bitmap.*;

class TextProbe {
  public static function main(){
		var font = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/assets/openSans.json'));
    var b = PNGBitmap.create(IOUtil.readFile("test/assets/openSans.png"));
    var o = new PNGBitmap(221,111); 
    var chars = new Map<String, Bitmap>();
    for(i in 0...font.chars.char.length) {
      var c = (cast font.chars.char)[i];
      var s = String.fromCharCode(Std.parseInt(c.id));
var bounds = {x: Std.parseInt(c.x), y: Std.parseInt(c.y), width: Std.parseInt(c.width), height: Std.parseInt(c.height)};
      chars[s] = b.copy(bounds);
    }
    var x = 0, y = 0;
    for(s in 'seba'.split('')) {
      var cc = chars[s];
      o.copyFrom(cc, {x: 0,y: 0}, {x:x, y: y, width: cc.width, height: cc.height });
      x+=cc.width;
    }
		BitmapIO.writeBitmap('test/assets/tmpFonts2.png', o);

  }
}
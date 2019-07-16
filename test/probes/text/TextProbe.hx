package probes.text;
import bitmap.*;

class TextProbe {
  public static function main(){
		var font = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/probes/text/openSans.json'));
    var b = PNGBitmap.create(IOUtil.readFile("test/probes/text/openSans.png"));
		// var b = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/probes/text/openSans.png'));
    // trace(font.chars.char[0]);
    var o = new PNGBitmap(300,300);// .create();

      // chars.push(b.copy(cast (cast font.chars.char)[0]) );

    // var chars:Array<Bitmap> = [];
    // for(i in 0...font.chars.char.length) {
    //   var c = (cast font.chars.char)[i];
    //   chars.push(b.copy(cast c) );
    // }
    // o.copyFrom(chars[0]);

var c = cast (cast font.chars.char)[0];

var bounds = {x: Std.parseInt(c.x), y: Std.parseInt(c.y), width: Std.parseInt(c.width), height: Std.parseInt(c.height)};
trace(bounds, b.bounds());
    var v = b.copy(bounds) ;
    // varo.copyFrom(c);
		IOUtil.writeBitmap('test/assets/tmpFonts.png', v);
  }
}
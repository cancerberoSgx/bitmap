import utest.Assert;
import bitmap.*;

class PNGBitmapTest  implements utest.ITest{
	public function new() {}

	public function testCreate() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.create(input);
		Assert.same([bitmap.width, bitmap.height],[109,145]);
    input.close();
	}
  
  public function testGet() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.create(input);
		Assert.same([bitmap.get(5,5),bitmap.get(33,34)],[Color.create(165, 171, 169,  255), Color.create(60, 40,  39,  255)]);
    input.close();
	}

public function  testCopy() {
    	var font = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/probes/text/openSans.json'));
    var b = PNGBitmap.create(IOUtil.readFile("test/assets/fonts.png"));
    var o = new PNGBitmap(300,300);// .create();
var c = cast (cast font.chars.char)[0];
var bounds = {x: Std.parseInt(c.x), y: Std.parseInt(c.y), width: Std.parseInt(c.width), height: Std.parseInt(c.height)};
trace(bounds, b.bounds());
    var v = b.copy(bounds) ;
		IOUtil.writeBitmap('test/assets/tmpFonts.png', v);
		Assert.isTrue(BitmapUtil.bitmapEquals(v, PNGBitmap.create(IOUtil.readFile("test/assets/fonts1.png"))));
  }

}

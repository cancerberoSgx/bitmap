import utest.Assert;
import bitmap.*;

class PNGBitmapTest implements utest.ITest {
	public function new() {}

	public function testCreate() {
		var input = IOUtil.readFile("test/assets/n.png");
		var bitmap = PNGBitmap.create(input);
		Assert.same([bitmap.width, bitmap.height], [109, 145]);
		input.close();
	}

	public function testGet() {
		var input = IOUtil.readFile("test/assets/n.png");
		var bitmap = PNGBitmap.create(input);
		Assert.same([bitmap.get(5, 5), bitmap.get(33, 34)], [Color.create(165, 171, 169, 255), Color.create(60, 40, 39, 255)]);
		input.close();
	}

	public function testCopy() {
		var font = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/assets/openSans.json'));
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/openSans.png"));
		var o = new PNGBitmap(300, 300); // .create();
		var c = cast(cast font.chars.char)[0];
		var bounds = {
			x: Std.parseInt(c.x),
			y: Std.parseInt(c.y),
			width: Std.parseInt(c.width),
			height: Std.parseInt(c.height)
		};
		var v = b.copy(bounds);
		BitmapIO.writeBitmap('test/assets/tmpopenSans.png', v);
		Assert.isTrue(BitmapUtil.bitmapEquals(v, PNGBitmap.create(IOUtil.readFile("test/assets/openSans1.png"))));
	}

	public function testCopy2() {
		var font = haxe.Json.parse(bitmap.IOUtil.readTextFile('test/assets/openSans.json'));
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/openSans.png"));
		var o = new PNGBitmap(221, 111);
		var chars = new Map<String, Bitmap>();
		for (i in 0...font.chars.char.length) {
			var c = (cast font.chars.char)[i];
			var s = String.fromCharCode(Std.parseInt(c.id));
			var bounds = {
				x: Std.parseInt(c.x),
				y: Std.parseInt(c.y),
				width: Std.parseInt(c.width),
				height: Std.parseInt(c.height)
			};
			chars[s] = b.copy(bounds);
		}
		var x = 0, y = 0;
		for (s in 'seba'.split('')) {
			var cc = chars[s];
			o.copyFrom(cc, {x: 0, y: 0}, {
				x: x,
				y: y,
				width: cc.width,
				height: cc.height
			});
			x += cc.width;
		}
		BitmapIO.writeBitmap('test/assets/tmpopenSans.png', o);
		Assert.isTrue(BitmapUtil.bitmapEquals(o, PNGBitmap.create(IOUtil.readFile("test/assets/openSans2.png"))));
	}
}

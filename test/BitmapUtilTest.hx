import haxe.io.BytesOutput;
import utest.Assert;
import bitmap.*;

class BitmapUtilTest implements utest.ITest {
	public function new() {}

	public function testbitmapEquals() {
		IOUtil.writeFile('test/assets/tmptestBitmapEquals.png', IOUtil.readFile("test/assets/n.png"));
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestBitmapEquals.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		b = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));

		a = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		a.set(2, 2, Color.create(222, 13, 144, 122));
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));

		b.set(2, 2, Color.create(222, 13, 144, 122));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}

	public function testbitmapEquals2() {
		var a = new PNGBitmap(6, 6);
		BitmapUtil.drawRectangle(a, 0, 0, 5, 5, Color.create(222, 222, 222, 132), true);
		BitmapUtil.drawRectangle(a, 2, 1, 2, 3, Color.create(12, 144, 0, 132), true);
		var b = new PNGBitmap(6, 6);
		BitmapUtil.drawRectangle(b, 0, 0, 5, 5, Color.create(222, 222, 222, 132), true);
		BitmapUtil.drawRectangle(b, 2, 1, 2, 3, Color.create(12, 144, 0, 132), true);
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		IOUtil.writeBitmap("test/assets/tmptestbitmapEquals2a.png", a);
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestbitmapEquals2a.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b, true));

		IOUtil.writeBitmap("test/assets/tmptestbitmapEquals2b.png", b);
		b = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestbitmapEquals2b.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		BitmapUtil.drawRectangle(b, 1, 1, 1, 1, Color.create(122, 144, 220, 232), true);
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));
	}

	public function testdrawRectangle() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		BitmapUtil.drawRectangle(a, 60, 20, 20, 40, Color.create(255, 44, 122, 132), true, Blend.mean);
		BitmapUtil.drawRectangle(a, 10, 20, 40, 22, Color.create(12, 144, 0, 132), false);
		IOUtil.writeBitmap('test/assets/tmptestdrawRectangle.png', a);
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestdrawRectangle.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		BitmapUtil.drawRectangle(a, 10, 20, 40, 22, Color.create(12, 144, 0, 131), false);
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));
	}

	public function testdrawLine() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		BitmapUtil.drawLine(a, 1, 112, 90, 22, Color.create(22, 144, 222, 190));
		BitmapUtil.drawLine(a, 36, 115, 95, 22, Color.create(222, 144, 222, 255));
		BitmapUtil.drawLine(a, 90, 115, 5, 22, Color.create(22, 244, 222, 55));
		IOUtil.writeBitmap('test/assets/tmptestdrawLine.png', a);
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/drawLine.png"));
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestdrawLine.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}
	// public function testdrawRectangle2() {
	//   var a =RawRgbaBitmap.create(IOUtil.readFile("test/assets/n.rgba"), 109, 145);
	//   BitmapUtil.drawRectangle(a, {x: 60,y:20,width:20,height:40},Color.create(255,44,122,255));
	//  IOUtil.writeBitmap('test/assets/tmptestdrawRectangle2.rgba', a);
	// 	Assert.isTrue(true);
	// }
}

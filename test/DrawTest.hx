import utest.Assert;
import bitmap.*;
import bitmap.Types.Blend;

class DrawTest implements utest.ITest {
	public function new() {}

	public function testdrawRectangle() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		a.draw.rectangle2( 60, 20, 20, 40, Color.create(255, 44, 122, 132), true, Blend.mean);
		a.draw.rectangle2( 10, 20, 40, 22, Color.create(12, 144, 0, 132), false);
		IOUtil.writeBitmap('test/assets/tmptestdrawRectangle.png', a);
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestdrawRectangle.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		a.draw.rectangle({
			x: 10,
			y: 20,
			width: 40,
			height: 22,
			c: Color.create(12, 144, 0, 131),
			fill: false
		});
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));
	}

	public function testdrawLine() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		a.draw.line(1, 112, 90, 22, Color.create(22, 144, 222, 190));
		a.draw.line(36, 115, 95, 22, Color.create(222, 144, 222, 255));
		a.draw.line(90, 115, 5, 22, Color.create(22, 244, 222, 55));
		IOUtil.writeBitmap('test/assets/tmptestdrawLine.png', a);
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/drawLine.png"));
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestdrawLine.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}

	public function testdrawTriangle() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		a.draw.triangle(1, 112, 90, 22, 122, 122, Color.create(22, 144, 222, 190));
		a.draw.triangle(36, 92, 60, 22, 20, 10, Color.create(222, 144, 222, 111), true,  Blend.mean);
		IOUtil.writeBitmap('test/assets/tmptestdrawTriangle.png', a);
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/drawTriangle.png"));
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestdrawTriangle.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}

}

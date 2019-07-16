import utest.Assert;
import bitmap.*;
import bitmap.Types.Blend;

class ColorsTest implements utest.ITest {
	public function new() {}

	public function testColorFilter() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		var r = a.color.filter({
			bitmap: a,
			red: {a: 1.5, c: 2},
			green: {a: 1.0, c: -15},
			alpha: {a: 0.6, c: 0}
		});
		IOUtil.writeBitmap('test/assets/tmpColors1.png', r);
		Assert.isTrue(BitmapUtil.bitmapEquals(PNGBitmap.create(IOUtil.readFile("test/assets/tmpColors1.png")), PNGBitmap.create(IOUtil
					.readFile("test/assets/colors1.png"))));
	}

	public function testGrayScale() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/openSans.png"));
		var r = a.color.grayScale({
			bitmap: a
		}).copy({
				x: 0,
				y: 0,
				width: 60,
				height: 60
			});
		IOUtil.writeBitmap('test/assets/tmpgrayScale.png', r);
		Assert.isTrue(BitmapUtil.bitmapEquals(PNGBitmap.create(IOUtil.readFile("test/assets/tmpgrayScale.png")), PNGBitmap.create(IOUtil
					.readFile("test/assets/grayScale.png"))));
	}

	public function testColorAccessors() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		var c = Color.create(23, 34, 56, 11);
		Assert.same(23, c.r);
		// trace(c.toString());
		Assert.same(34, c.g);
		Assert.same(56, c.b);
		Assert.same(11, c.a);
		var c2 = c;
		c.r = 141;
		// trace(c.toString());
		Assert.same(141, c.r);
		Assert.same(23, c2.r);

		Assert.same(34, c.g);
		Assert.same(56, c.b);
		Assert.same(11, c.a);

		c.b = 231;
		Assert.same(141, c.r);
		Assert.same(23, c2.r);
		Assert.same(231, c.b);
		Assert.same(11, c.a);
		Assert.same(231, c.b);
		Assert.same(56, c2.b);

		c.b = 214;
		Assert.same(141, c.r);
		Assert.same(23, c2.r);
		Assert.same(214, c.b);
		Assert.same(56, c2.b);
    // setting it doesn't modify the bitmap
    var c3 = a.get(2,2);
    Assert.isFalse(c3.b==0);
    c3.b=0;
    Assert.isTrue(PNGBitmap.create(IOUtil.readFile("test/assets/n.png")).equals(a));
    // a.get(2,3).b=9;
		// IOUtil.writeBitmap('test/assets/tmpColors2.png', a);
	}
}

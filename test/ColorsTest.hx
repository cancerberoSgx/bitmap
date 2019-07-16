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
}

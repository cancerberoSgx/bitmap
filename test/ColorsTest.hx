import utest.Assert;
import bitmap.*;
import bitmap.Types.Blend;

class ColorsTest implements utest.ITest {
	public function new() {}

	public function testColorFilter() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		var r = a.color.filter({
			bitmap: a,
			red: {c: 2, a: 1.5},
			green: {c: -15, a: 1.0},
			alpha: {a: 0.6, c: 0}
		});
		IOUtil.writeBitmap('test/assets/tmpColors1.png', r);
		Assert.isTrue(BitmapUtil.bitmapEquals(PNGBitmap.create(IOUtil.readFile("test/assets/tmpColors1.png")), PNGBitmap.create(IOUtil
					.readFile("test/assets/colors1.png"))));
	}
}

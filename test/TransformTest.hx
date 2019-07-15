import utest.Assert;
import bitmap.*;
import bitmap.transformation.*;

class TransformTest implements utest.ITest {
	public function new() {}

	public function testAverage() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		var c = ColorUtil.average(bitmap, {
			x: 52,
			y: 146,
			width: 4,
			height: 4
		});
		Assert.same([c.r, c.g, c.b, c.a], [52, 28, 111, 255]);
	}

	public function testPixelize() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		var result = bitmap.transform.pixelize({
			width: 50,
			height: 50,
			modify: true,
			alpha: 255
		});
		IOUtil.writeBitmap('test/assets/tmpPixelize.png', result);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/pixelize.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result, b2));
	}

	function testDummy() {
		Assert.isTrue(true);
	}

	public function testConvolve() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		var kernel = [[0.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 0.0]];
		var result = bitmap.transform.convolve({
			kernel: kernel,
			bias: 0.2,
			factor: 1.1
		});
		IOUtil.writeBitmap('test/assets/tmpConvolve1.png', result);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/convolve.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result, b2));
	}

	public function testAffine1() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		var result = bitmap.transform.affine({
			matrix: {
				a: 0.4,
				b: 0.5,
				c: 0.2,
				d: 1.5,
				e: 2.0,
				f: 3.0
			}
		});
		IOUtil.writeBitmap('test/assets/tmpAffine1.png', result.bitmap);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/affine.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result.bitmap, b2));
	}

	public function testAffine2() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		bitmap.transform.affine({
			affine: new Affine().flipX(),
			modify: true
		});
		IOUtil.writeBitmap('test/assets/tmpAffine2.png', bitmap);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/affine2.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(bitmap, b2));

    bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		bitmap.transform.affine({
			affine: new Affine().flipX().flipX(),
			modify: true
		});    
    Assert.isTrue(BitmapUtil.bitmapEquals(bitmap, PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"))));
	}
}

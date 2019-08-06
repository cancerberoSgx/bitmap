import utest.Assert;
import bitmap.Types.Background;
import bitmap.transformation.*;
import bitmap.*;

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
			output: bitmap,
			alpha: 255
		});
		BitmapIO.writeBitmap('test/assets/tmpPixelize.png', result);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/pixelize.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result, b2));
	}

	function testDummy() {
		Assert.isTrue(true);
	}

	public function testConvolve1() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		var kernel = [[0.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 0.0]];
		var result = bitmap.transform.convolve({
			kernel: kernel,
			bias: 0.2,
			factor: 1.1,
		});
		BitmapIO.writeBitmap('test/assets/tmpConvolve1.png', result);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/convolve.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result, b2));
	}

	public function testConvolve2() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		bitmap.noRangeCheck = true;
		var result = bitmap.transform.convolve(Convolution.blur(7, 0.7));
		BitmapIO.writeBitmap('test/assets/tmpConvolve2.png', result);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/convolve2.png"));
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
		BitmapIO.writeBitmap('test/assets/tmpAffine1.png', result.bitmap);
		var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/affine1.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(result.bitmap, b2));
	}

	public function testAffine2() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		var result = bitmap.transform.affine({
			affine: new Affine().scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6),
			output: bitmap,
		});
		BitmapIO.writeBitmap('test/assets/tmpAffine2.png',  bitmap);
		Assert.isTrue(BitmapUtil.bitmapEquals(bitmap, PNGBitmap.create(IOUtil.readFile("test/assets/affine2.png"))));
	}

	public function testAffinePrecision() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		bitmap.noRangeCheck = true;
		bitmap.transform.affine({
			affine: new Affine().rotateDeg(24),
			precision: true,
			output: bitmap
		});
		BitmapIO.writeBitmap('test/assets/tmpAffine3.png', bitmap);
		Assert.isTrue(BitmapUtil.bitmapEquals(bitmap, PNGBitmap.create(IOUtil.readFile("test/assets/affine3.png"))));

		// b2.noRangeCheck = true;
		// b2.transform.affine({
		// 	affine: new Affine().flipX().flipY(),
		// 	modify: true
		// });
		// Assert.isTrue(BitmapUtil.bitmapEquals(b2, PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"))));

		// var bitmap = new PNGBitmap(16, 16);
		// bitmap.noRangeCheck = true;
		// // bitmap.draw.line( 2,3,13, 7, Color.create(222, 222, 9, 132));
		// bitmap.set(10,6, Color.create(222, 222, 9, 132) );
		// bitmap.set(9,6, Color.create(2, 222, 9, 132) );
		// BitmapIO.writeBitmap('test/assets/tmpAffine4.png', bitmap);

		// var bitmap = new PNGBitmap(16, 16);
		// bitmap.noRangeCheck = true;
		// // bitmap.draw.line( 2,3,13, 7, Color.create(222, 222, 9, 132));
		// bitmap.set(10,6, Color.create(222, 222, 9, 132) );
		// bitmap.set(9,6, Color.create(2, 222, 9, 132) );
		// BitmapIO.writeBitmap('test/assets/tmpAffine4.png', bitmap);

		// bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		// 	bitmap.noRangeCheck = true;
		// bitmap.transform.affine({
		// 	affine: new Affine().rotateDeg(24),
		// 	modify: true
		// });
		// BitmapIO.writeBitmap('test/assets/tmpAffine5.png', bitmap);

		Assert.isTrue(true);
	}
}

import utest.Assert;
import bitmap.BitmapIO;
import haxe.io.*;
import bitmap.*;

class BitmapIOTest implements utest.ITest {
	public function new() {}

	@:timeout(6500)
	public function testBitmapFromUrl(async:utest.Async) {
		var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png';
		BitmapIO.fromUrl(url).then(bitmap -> {
			Assert.isTrue(bitmap != null);
			Assert.isTrue(BitmapUtil.bitmapEquals(bitmap, PNGBitmap.create(IOUtil.readFile('test/assets/parrots.png'))));
			BitmapIO.writeBitmap('test/assets/tmpFetchPromise.png', bitmap);
			Assert.isTrue(BitmapUtil.bitmapEquals(PNGBitmap.create(IOUtil.readFile('test/assets/tmpFetchPromise.png')),
					PNGBitmap.create(IOUtil.readFile('test/assets/parrots.png'))));
			async.done();
		});
	};
}

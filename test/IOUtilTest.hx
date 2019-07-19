import utest.Assert;
import bitmap.IOUtil;
import haxe.io.*;
import bitmap.*;

class IOUtilTest implements utest.ITest {
	public function new() {}

	public function testReadFile() {
		var input = IOUtil.readFile("test/assets/n.png");
		Assert.stringContains("Input", Type.getClassName(Type.getClass(input)));
		input.close();
	}

	public function testWriteFile() {
		var input = IOUtil.readFile("test/assets/n.png");
		IOUtil.writeFile('test/assets/tmptestwriteFile.png', input);
		Assert.equals(IOUtil.readFile("test/assets/n.png").readAll().length, IOUtil.readFile("test/assets/tmptestwriteFile.png").readAll().length);
	}

	@:timeout(6500)
	public function testFetchResource(async:utest.Async) {
		var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png';
		IOUtil.fetchResource(url, (err, data) -> {
			if (err != null) {
				trace('ERROR', err);
				Assert.fail('Expect no error');
				async.done();
				return;
			}
			var bytes = Bytes.ofData(data);
			IOUtil.writeFile('test/assets/tmpFetchResource.png', new BytesInput(bytes));
			Assert.isTrue(BitmapUtil.bitmapEquals(PNGBitmap.create(IOUtil.readFile('test/assets/tmpFetchResource.png')),
					PNGBitmap.create(IOUtil.readFile('test/assets/parrots.png'))));
			async.done();
		});
	}
}

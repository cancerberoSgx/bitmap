import utest.Assert;
import bitmap.RGBABitmap;
import bitmap.IOUtil;

class IOUtilTest {
	public function new() {}

	public function testIOUtilfromFile() {
		var input = IOUtil.fromFile("test/assets/n.png");
		Assert.stringContains("Input", Type.getClassName(Type.getClass(input)));
    input.close();
	}
}

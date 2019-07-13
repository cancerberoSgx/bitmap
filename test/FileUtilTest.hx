import utest.Assert;
import bitmap.RGBABitmap;
import bitmap.FileUtil;

class FileUtilTest {
	public function new() {}

	public function testFileUtilReadBinaryReturnsInput() {
		var input = FileUtil.readBinary("test/assets/n.png");
		Assert.stringContains("Input", Type.getClassName(Type.getClass(input)));
    input.close();
	}
}

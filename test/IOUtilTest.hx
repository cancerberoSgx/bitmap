import utest.Assert;
import bitmap.RGBABitmap;
import bitmap.IOUtil;

class IOUtilTest implements utest.ITest{
	public function new() {}

	public function testreadFile() {
		var input = IOUtil.readFile("test/assets/n.png");
		Assert.stringContains("Input", Type.getClassName(Type.getClass(input)));
    input.close();
	}
}

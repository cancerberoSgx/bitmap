import utest.Assert;
import bitmap.IOUtil;

class IOUtilTest implements utest.ITest {
	public function new() {}

	public function testreadFile() {
		var input = IOUtil.readFile("test/assets/n.png");
		Assert.stringContains("Input", Type.getClassName(Type.getClass(input)));
		input.close();
	}

	public function testwriteFile() {
		var input = IOUtil.readFile("test/assets/n.png");
		IOUtil.writeFile('test/assets/tmptestwriteFile.png', input);
		Assert.equals(IOUtil.readFile("test/assets/n.png").readAll().length,  IOUtil.readFile("test/assets/tmptestwriteFile.png").readAll().length);
	}
  
}

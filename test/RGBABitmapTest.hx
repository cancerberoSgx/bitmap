import utest.Assert;
import bitmap.RGBABitmap;
import bitmap.FileUtil;

class RGBABitmapTest {
	public function new() {}

	public function testCreate() {
		var input = FileUtil.readBinary("test/assets/n.png");
    var bitmap =RGBABitmap.crete(input);
		Assert.same([bitmap.width, bitmap.height],[109,145]);
    input.close();
	}
  public function testGet() {
		var input = FileUtil.readBinary("test/assets/n.png");
    var bitmap =RGBABitmap.crete(input);
		Assert.same([bitmap.get(5,5)],[{r:165, g:171, b: 169, a: 255}]);
    input.close();
	}

}

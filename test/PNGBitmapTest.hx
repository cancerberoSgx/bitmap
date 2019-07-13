import utest.Assert;
import bitmap.PNGBitmap;
import bitmap.IOUtil;

class PNGBitmapTest  implements utest.ITest{
	public function new() {}

	public function testCreate() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.crete(input);
		Assert.same([bitmap.width, bitmap.height],[109,145]);
    input.close();
	}
  public function testGet() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.crete(input);
		Assert.same([bitmap.get(5,5),bitmap.get(33,34)],[{r:165, g:171, b: 169, a: 255}, {r:60, g:40, b: 39, a: 255}]);
    input.close();
	}

}

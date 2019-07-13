import utest.Assert;
import bitmap.*;

class PNGBitmapTest  implements utest.ITest{
	public function new() {}

	public function testCreate() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.create(input);
		Assert.same([bitmap.width, bitmap.height],[109,145]);
    input.close();
	}
  
  public function testGet() {
		var input = IOUtil.readFile("test/assets/n.png");
    var bitmap =PNGBitmap.create(input);
		Assert.same([bitmap.get(5,5),bitmap.get(33,34)],[Color.create(165, 171, 169,  255), Color.create(60, 40,  39,  255)]);
    input.close();
	}

}

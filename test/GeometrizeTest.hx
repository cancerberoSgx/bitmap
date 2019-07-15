import utest.Assert;
import bitmap.*;
import bitmap.Types.Blend;

class GeometrizeTest implements utest.ITest {
	public function new() {}

	public function testdrawRectangle() {
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		var b= PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
	
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

	}


}

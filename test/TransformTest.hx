import utest.Assert;
import bitmap.*;

class TransformTest implements utest.ITest {
	public function new() {}

	public function testPixelize() {
    var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		var result = bitmap.transform.pixelize({
      width: 50,
      height: 50,
      modify: true,
      alpha: 255
    });
    	IOUtil.writeBitmap('test/assets/tmpPixelize.png', result);
    var b2 = PNGBitmap.create(IOUtil.readFile("test/assets/pixelize.png"));
    Assert.isTrue(BitmapUtil.bitmapEquals(result, b2));
	}

  public function testAverage() {
    var bitmap = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		// var c = bitmap.get(53,148); // 49,26.106
    var c = ColorUtil.average(bitmap, {x:52,y:146,width:4,height:4});
    Assert.same([ c.r,c.g,c.b,c.a], [52, 28, 111, 255]);
    // trace(c, c.r,c.g,c.b,c.a);
	}

}

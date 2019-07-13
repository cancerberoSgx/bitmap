import haxe.io.BytesOutput;
import utest.Assert;
import bitmap.*;

class BitmapUtilTest  implements utest.ITest{
	public function new() {}

	public function testbitmapEquals() {
		IOUtil.writeFile('test/assets/tmptestBitmapEquals.png', IOUtil.readFile("test/assets/n.png"));
    var a =PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
    var b =PNGBitmap.create(IOUtil.readFile("test/assets/tmptestBitmapEquals.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}
	public function testdrawRectangle() {
    var a =PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));

    BitmapUtil.drawRectangle(a, {x: 60,y:20,width:20,height:40},  Color.create(255,44,122,255));
	 IOUtil.writeBitmap('test/assets/tmptestdrawRectangle.png', a);
    var b =PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
		Assert.isTrue(true);
	}
  
  // public function testdrawRectangle2() {
  //   var a =RawRgbaBitmap.create(IOUtil.readFile("test/assets/n.rgba"), 109, 145);
  //   BitmapUtil.drawRectangle(a, {x: 60,y:20,width:20,height:40},Color.create(255,44,122,255));
	//  IOUtil.writeBitmap('test/assets/tmptestdrawRectangle2.rgba', a);
	// 	Assert.isTrue(true);
	// }
}

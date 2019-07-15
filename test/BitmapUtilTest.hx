import utest.Assert;
import bitmap.*;
import bitmap.Types.Blend;

class BitmapUtilTest implements utest.ITest {
	public function new() {}

	public function testbitmapEquals() {
		IOUtil.writeFile('test/assets/tmptestBitmapEquals.png', IOUtil.readFile("test/assets/n.png"));
		var a = PNGBitmap.create(IOUtil.readFile("test/assets/n.png"));
		var b = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestBitmapEquals.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		b = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));

		a = PNGBitmap.create(IOUtil.readFile("test/assets/drawRectangle.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		a.set(2, 2, Color.create(222, 13, 144, 122));
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));

		b.set(2, 2, Color.create(222, 13, 144, 122));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));
	}

	public function testbitmapEquals2() {
		var a = new PNGBitmap(6, 6);
		a.draw.rectangle2( 0, 0, 5, 5, Color.create(222, 222, 222, 132), true);
		a.draw.rectangle2( 2, 1, 2, 3, Color.create(12, 144, 0, 132), true);
		var b = new PNGBitmap(6, 6);
		b.draw.rectangle2(0, 0, 5, 5, Color.create(222, 222, 222, 132), true);
		b.draw.rectangle2(2, 1, 2, 3, Color.create(12, 144, 0, 132), true);
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		IOUtil.writeBitmap("test/assets/tmptestbitmapEquals2a.png", a);
		a = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestbitmapEquals2a.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		IOUtil.writeBitmap("test/assets/tmptestbitmapEquals2b.png", b);
		b = PNGBitmap.create(IOUtil.readFile("test/assets/tmptestbitmapEquals2b.png"));
		Assert.isTrue(BitmapUtil.bitmapEquals(a, b));

		b.draw.rectangle2(1, 1, 1, 1, Color.create(122, 144, 220, 232), true);
		Assert.isFalse(BitmapUtil.bitmapEquals(a, b));
	}

  public function testCompare(){
    var a = new PNGBitmap(4, 4);
    var b = new PNGBitmap(5, 5);
    a.fill(Color.create(0,0,0,0));
    b.fill(Color.create(0,0,0,0));
    Assert.same(0, BitmapUtil.compare(a,b,{x:0,y:0,width:2,height:2}));
    b.set(0,0,Color.create(5,5,5,5));
    var d1 = BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3});
Assert.isTrue(Math.abs(d1)>Math.abs(0));
    // Assert.same(0.0012254901960784314, BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3}));
    b.set(0,1,Color.create(12,12,12,12));

    // Assert.same(0.0012254901960784314, BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3}));
    var d2 = BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3});
// Assert.isTrue(Math.abs(d2)>Math.abs(0));
Assert.isTrue(Math.abs(d2)>Math.abs(d1));
    a.fill(Color.create(33,33,33,33));
    var d3 = BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3});
Assert.isTrue(Math.abs(d3)>Math.abs(d2));

    a.fill(Color.create(233,233,233,233));
    var d4 = BitmapUtil.compare(a,b,{x:0,y:0,width:3,height:3});
Assert.isTrue(Math.abs(d4)>Math.abs(d3));
    
    // Assert.same(-0.8615196078431373, BitmapUtil.compare(a,b,{x:0,y:0,width:2,height:2}));
  }

	public function testMultiply() {
		var a = [[8.0, 3.0], [2.0, 4.0], [3.0, 6.0]],
    b = [[1.0, 2.0, 3.0], [4.0, 6.0, 8.0]];
    Assert.same(Util.multiply(a, b), [[20,34,48],[18,28,38],[27,42,57]]);
	}
public function testRandom() {
   var a= [for(i in 0...30)Util.random(0,0)];
   Assert.isTrue(a.filter(function(f)return f==0).length>0);
   Assert.isTrue(a.filter(function(f)return f==1).length==0);
    a= [for(i in 0...50)Util.random(0,3)];
   Assert.isTrue(a.filter(function(f)return f==0).length>0);
   Assert.isTrue(a.filter(function(f)return f==1).length>0);
   Assert.isTrue(a.filter(function(f)return f==2).length>0);
   Assert.isTrue(a.filter(function(f)return f==3).length>0);
	}

}

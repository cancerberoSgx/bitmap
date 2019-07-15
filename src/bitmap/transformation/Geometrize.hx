package bitmap.transformation;

typedef GeometrizeOptions = {
  >TransformationOptions,
  @:optional var alpha:Float;
  @:optional var shapeCount:Int;
  @:optional var iterations:Int;
  @:optional var shapes:Array<Shapes>;
}
enum Shapes {
  triangle;
  rectangle;
  line;
}
class Geometrize {
  var shapes:Array<Shapes>;
  var shapeCount:Int;
  var buffer:Bitmap;
  var bitmap:Bitmap;
  var target:Bitmap;
  var region:Types.Rectangle;
  public function geometrize(o:GeometrizeOptions) {
    bitmap = o.bitmap;
    target=bitmap.clone();
    buffer=bitmap.clone();
		var output = o.output == null ? o.bitmap.clone() : o.output;
    region = o.region == null ? {
			x: 0,
			y: 0,
			width: output.width,
			height: output.height
		}
			: o.region;
    shapeCount= o.shapeCount==null?100:o.shapeCount;
    shapes = o.shapes ==null?[Shapes.triangle]:o.shapes;
    var iterations = o.iterations==null?200:o.iterations;
    for(i in 0...iterations){
      var fragment = bestFragment();
    }
  }
  function bestFragment(){
    var best=10000;
    for(i in 0...shapeCount){
      var tx = Util.randomIntArray(3, region.x, region.x+region.width);
      var ty = Util.randomIntArray(3, region.y, region.y+region.height);
      var ex=Util.minMaxElements(tx);
      var ey=Util.minMaxElements(ty);
      var r =  {x: ex.min, y: ey.min, width: ex.max-ex.min, height: ey.max-ey.min};
      buffer.copyFrom(bitmap,r);
      buffer.draw.triangle(tx[0], ty[0], tx[1], ty[1],tx[2], ty[2], ColorUtil.random(alpha));


      // var dtbr:Int = t.r - b.r;
			// 	var dtbg:Int = t.g - b.g;
			// 	var dtbb:Int = t.b - b.b;
			// 	var dtba:Int = t.a - b.a;
				
			// 	var dtar:Int = t.r - a.r;
			// 	var dtag:Int = t.g - a.g;
			// 	var dtab:Int = t.b - a.b;
			// 	var dtaa:Int = t.a - a.a;
				
			// 	total -= (dtbr * dtbr + dtbg * dtbg + dtbb * dtbb + dtba * dtba);
			// 	total += (dtar * dtar + dtag * dtag + dtab * dtab + dtaa * dtaa);

    }
  }
}

typedef Fragment{
  var bitmap:Bitmap;
  var region:Region;
}
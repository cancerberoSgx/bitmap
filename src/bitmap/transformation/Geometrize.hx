package bitmap.transformation;

typedef GeometrizeOptions = {
  >TransformationOptions,
  @:optional var alpha:Float;
  @:optional var shapeCount:Int;
  @:optional var iterations:Int;
}
enum Shapes {
  triangle;
  rectangle;
  line;
}
class Geometrize {
  // var score:Float=0.0;
  var shapeCount:Int;
  public function geometrize(o:GeometrizeOptions) {
		var output = o.output == null ? o.bitmap.clone() : o.output;
    var region = o.region == null ? {
			x: 0,
			y: 0,
			width: output.width,
			height: output.height
		}
			: o.region;
    shapeCount= o.shapeCount==null?100:o.shapeCount;
    var iterations = o.iterations==null?200:o.iterations;
    for(i in 0...iterations){
      var fragment = bestFragment();
    }
  }
  function bestFragment(){
    for(i in 0...shapeCount){

    }
  }
}

typedef Fragment{
  var bitmap:Bitmap;
  var region:Region;
}
// TODO: count present colors first and random on those
package bitmap.transformation;

import bitmap.transformation.*;
import bitmap.transformation.*;

typedef GeometrizeOptions = {
	> Transform.TransformationOptions,
	@:optional var alpha:Int;
	@:optional var shapeCount:Int;
	@:optional var iterations:Int;
	@:optional var shapes:Array<String>;
}

typedef Shape = {
	var type:String;
	var points:Array<Int>;
	var color:Color;
};

// enum Shapes {
// 	triangle;
// 	rectangle;
// 	line;
// }

class Geometrize {
	var shapes:Array<String>;
	var shapeCount:Int;
	var alpha:Int;
	var bitmap:Bitmap;
	var target:Bitmap;
	var buffer:Bitmap;
	var region:Types.Rectangle;

	public function new() {}

	public function geometrize(o:GeometrizeOptions) {
		bitmap = o.bitmap;			 
		target = bitmap.clone(true);
		alpha = o.alpha == null ? 128 : o.alpha;
		shapeCount = o.shapeCount == null ? 100 : o.shapeCount;
		shapes = o.shapes == null ? ["triangle","line","rectangle", "point"] : o.shapes;
		var iterations = o.iterations == null ? 200 : o.iterations;
		var output = o.output == null ? o.bitmap.clone() : o.output;
		if (o.region == null) {
			region = {
				x: 0,
				y: 0,
				width: Util.min(output.width, bitmap.width),
				height: Util.min(output.height, bitmap.height)
			}
		};
		for (i in 0...iterations) {
			var fragment = bestFragment();
			if (fragment.shape.type=="triangle") {
				target.draw.triangle(fragment.shape.points[0], fragment.shape.points[1], fragment.shape.points[2], fragment.shape.points[3],
					fragment.shape.points[4], fragment.shape.points[5], fragment.shape.color, true, Types.Blend.mean);
			} else if (fragment.shape.type=="rectangle") {
				target.draw.rectangle2(fragment.shape.points[0], fragment.shape.points[1], fragment.shape.points[2], fragment.shape.points[3], fragment.shape.color, true, Types.Blend.mean);
			} else if (fragment.shape.type=="line") {
				target.draw.line(fragment.shape.points[0], fragment.shape.points[1], fragment.shape.points[2], fragment.shape.points[3] , fragment.shape.color,   Types.Blend.mean);
			}else if (fragment.shape.type=="point") {
				target.set(fragment.shape.points[0], fragment.shape.points[1],fragment.shape.color);
			} else {
				throw 'not supported shape';
			}
		}
		return {
			bitmap: target
		}
	}

	function bestFragment() {
		var best = 999.9;
		var bestShape:Shape = null;
		for (i in 0...shapeCount) {
      buffer = target.clone();
			var tx = Util.randomIntArray(3, 0, region.width -1);
			var ty = Util.randomIntArray(3, 0,  region.height -1);
			var ex = Util.minMaxElements(tx);
			var ey = Util.minMaxElements(ty);
			var r = {
				x: ex.min,
				y: ey.min,
				width: ex.max - ex.min-1,
				height: ey.max - ey.min-1
			};
			var c = ColorUtil.randomGray(alpha);
      var shapeType = Util.randomArrayItem(shapes);
      var shape:Shape=null;
      if(shapeType=="triangle"){
        shape = {
          type:shapeType,
          points: [tx[0], ty[0], tx[1], ty[1], tx[2], ty[2]],
          color: c
        }
        buffer.draw.triangle(tx[0], ty[0], tx[1], ty[1], tx[2], ty[2], c, true, Types.Blend.mean);
      }else if(shapeType=="rectangle"){
         shape = {
          type: shapeType,
          points: [ex.min, ey.min, ex.max-ex.min, ey.max-ey.min],
          color: c
        }
        buffer.draw.rectangle2(ex.min, ey.min, ex.max-ex.min, ey.max-ey.min, c, true, Types.Blend.mean);
      }else if(shapeType=="point"){
         shape = {
          type: shapeType,
          points: [tx[0], ty[0]],
          color: c
        }
        r = {
          x: Util.max(0,tx[0]-1), y: Util.max(0,ty[0]-1), width: 3, height: 3
        };
        buffer.set(tx[0], ty[0], c);
      }else if(shapeType=="line"){
         shape = {
          type: shapeType,
          points: [tx[0], ty[0], tx[1], ty[1]],
          color: c
        }
        buffer.draw.line(tx[0], ty[0], tx[1], ty[1], c, Types.Blend.mean);
      }
			var d = Math.abs(buffer.compare(bitmap)); // TODO: in r
      // trace(d);
			if (best>d) {
				best = d;
				bestShape = shape;
			}
		}
		return {
			shape: bestShape,
			score: best
		}
	}
}

typedef Fragment = {
	var bitmap:Bitmap;
	var region:Types.Rectangle;
}

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
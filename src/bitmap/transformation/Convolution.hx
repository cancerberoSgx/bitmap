package bitmap.transformation;

import bitmap.*;

typedef ConvolveOptions = {
	> Transform.TransformationOptions,
	// public var input: Bitmap;
	public var kernel:Array<Array<Float>>;
	@:optional public var bias:Float;
	@:optional public var factor:Float;
	// @:optional public var alpha:Float;
}

class Convolution {
	public static function convolve(o:ConvolveOptions) {
		Sure.sure(o.bitmap != o.output);
		Sure.sure(o.output==null||o.bitmap.width == o.output.width && o.bitmap.height == o.output.height);
		var output = o.output==null?o.bitmap.clone():o.output, data = o.bitmap, width = o.bitmap.width, height = o.bitmap.height, matrix = o.kernel, w = matrix[0].length, h = matrix.length, half = Math.floor(h / 2), factor = o.factor == null ? 1.0 : o.factor, bias = o.bias == null ? 0.0 : o.bias;
		for (y in 0...height ) {
			for (x in 0...width ) {
				var px = (y * width + x) * 4;
				var r = 0.0, g = 0.0, b = 0.0;
				for (cy in 0...w) {
					for (cx in 0...h) {
            // var ky=y + (cy - half), kx=x + (cx - half)
            // var c = data.get(x,y);
            // r+=Math.round(c.r*matrix[cy][cx]);
            // g+=Math.round(c.g*matrix[cy][cx]);
            // b+=Math.round(c.b*matrix[cy][cx]);

						var cpx = ((y + (cy - half)) * width + (x + (cx - half))) * 4;
            if(data.data.get(cpx + 0)==null||matrix[cy][cx]==null) {
              // trace(x, y, cpx, data.data.length, cy, cx);
              // continue;
            }
            else {
              // trace('NO err');
            r+=data.data.get(cpx + 0)*matrix[cy][cx];
            g+=data.data.get(cpx + 1)*matrix[cy][cx];
            b+=data.data.get(cpx + 2)*matrix[cy][cx];
            }
					}
				}
        output.data.set(px+0, Util.clamp(Math.round(factor * r + bias), 0, 255));
        output.data.set(px+1, Util.clamp(Math.round(factor * g + bias), 0, 255));
        output.data.set(px+2, Util.clamp(Math.round(factor * b + bias), 0, 255));
        // output.data.set(px+3, o.alpha==null ? 255: o.alpha) ;
        output.data.set(px+3, data.data.get(px+3)) ;
        // output.data.set(px+3, 255) ;
			}
		}
  return output;
	}
}
/*
	var data = input.data;
	  var out = result.data;
	  var width = this.w;
	  var height = this.h;
	  var matrix = this.matrix;
	  var w = matrix[0].length;
	  var h = matrix.length;
	  var half = Math.floor(h / 2);
	  var factor = this._factor;
	  var bias = this._bias;

	  for (var y = 0; y < height - 1; y++) {
	for (var x = 0; x < width - 1; x++) {
	  var px = (y * width + x) * 4;
	  var r = 0, g = 0, b = 0;

	  for (var cy = 0; cy < w; ++cy) {
		for (var cx = 0; cx < h; ++cx) {
		  var cpx = ((y + (cy - half)) * width + (x + (cx - half))) * 4;
		  r += data[cpx + 0] * matrix[cy][cx];
		  g += data[cpx + 1] * matrix[cy][cx];
		  b += data[cpx + 2] * matrix[cy][cx];
		}
	  }

	  out[px + 0] = factor * r + bias;
	  out[px + 1] = factor * g + bias;
	  out[px + 2] = factor * b + bias;
	  out[px + 3] = data[px + 3];
	}
	  }
	};
 */

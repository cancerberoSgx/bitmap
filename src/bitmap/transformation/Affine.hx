package bitmap.transformation;

import bitmap.*;
import haxe.io.UInt16Array;

typedef AffineOptions = {
	> Transform.TransformationOptions,
	var matrix:AffineMatrix;
	@:optional var region:Types.Rectangle;
}

class Affine {
	var matrix:AffineMatrix;

	public function new() {
		matrix = identity();
	}

	public static function identity() {
		return {
			a: 1.0,
			b: 0.0,
			c: 0.0,
			d: 1.0,
			e: 0.0,
			f: 0.0
		};
	}

	/**
	 * Multiplies current matrix with new matrix values.
	 */
	public function multiply(m:AffineMatrix) {
		var a1 = matrix.a, b1 = matrix.b, c1 = matrix.c, d1 = matrix.d, e1 = matrix.e, f1 = matrix.f;
		/* matrix order (canvas compatible):
		 * ace
		 * bdf
		 * 001
		 */
		matrix.a = a1 * m.a + c1 * m.b;
		matrix.b = b1 * m.a + d1 * m.b;
		matrix.c = a1 * m.c + c1 * m.d;
		matrix.d = b1 * m.c + d1 * m.d;
		matrix.e = a1 * m.e + c1 * m.f + e1;
		matrix.f = b1 * m.e + d1 * m.f + f1;
		return this;
	}

	// /**
	//  * Rotates current matrix accumulative by angle.
	//  * @param angle - angle in radians
	//  */
	// public function rotate(angle:Float) {
	// 	var cos = Math.cos(angle), sin = Math.sin(angle);
	// 	this.transform(cos, sin, -sin, cos, 0, 0);
	// 	return this;
	// }

	/**
	 * Apply current matrix to x and y point.
	 * Returns a point object.
	 *
	 * @param  x - value for x
	 * @param  y - value for y
	 * @returns  A new transformed point object
	 */
	public inline function applyToPoint(x:Int, y:Int):Types.Point {
		return {
			x: Math.round(x * matrix.a + y * matrix.c + matrix.e),
			y: Math.round(x * matrix.b + y * matrix.d + matrix.f)
		};
	}

	public function transform(o:AffineOptions) {
		// var output = o.output ==null ? o.bitmap.clone() : o.output;
    // Sure.sure(o.bitmap.width==output.width&&o.input.height==output.height);
    matrix=o.matrix;
    var output = o.bitmap.clone();// we need to work on a copy
    for (y in 0...o.bitmap.height) {
			for (x in 0...o.bitmap.width) {
        var p = applyToPoint(x, y);
        output.set(p.x,p.y, o.bitmap.get(x,y), true);
      }
		}
    // TODO: o.modify
    return {
      bitmap:output,
      affine: this
    }
	}
  
	// /**
	//  * Apply current matrix to array with point objects or point pairs.
	//  * Returns a new array with points in the same format as the input array.
	//  *
	//  * A point object is an object literal:
	//  *
	//  * {x: x, y: y}
	//  *
	//  * so an array would contain either:
	//  *
	//  * [{x: x1, y: y1}, {x: x2, y: y2}, ... {x: xn, y: yn}]
	//  *
	//  * or
	//  * [x1, y1, x2, y2, ... xn, yn]
	//  *
	//  * @param points - array with point objects or pairs
	//  * @returns  A new array with transformed points
	//  */
	// public function applyToPoints(points:Array<Types.Point>) {
	// 	var i = 0, p:Types.Point, l:Int, mxPoints:Array<Types.Point> = [];
	// 	if (typeof points[0] == = 'number') {
	// 		l = points.length;
	// 		while (i < l) {
	// 			p = this.applyToPoint(points[i++], points[i++]);
	// 			mxPoints.push(p.x, p.y);
	// 		}
	// 	} else {
	// 		for (;
	// 		p = points[i];
	// 		i++) {
	// 			mxPoints.push(this.applyToPoint(p.x, p.y));
	// 		}
	// 	}
	// 	return mxPoints;
	// }
	// /**
	//  * Apply current matrix to a typed array with point pairs. Although
	//  * the input array may be an ordinary array, this method is intended
	//  * for more performant use where typed arrays are used. The returned
	//  * array is regardless always returned as a UInt16Array.
	//  *
	//  * @param   points   array with point pairs
	//  * @returns A new array with transformed points
	//  */
	// public function applyToArray(points:UInt16Array):UInt16Array {
	// 	var i = 0, p:Point, l = points.length, mxPoints = new UInt16Array(l);
	// 	while (i < l) {
	// 		p = this.applyToPoint(points[i], points[i + 1]);
	// 		mxPoints[i++] = p.x;
	// 		mxPoints[i++] = p.y;
	// 	}
	// 	return mxPoints;
	// }
	// /**
	//  * Returns true if matrix is an identity matrix (no transforms applied).
	//  * @returns True if identity (not transformed)
	//  */
	// isIdentity: function() {
	// 	return (this._isEqual(this.a, 1) &&
	// 			this._isEqual(this.b, 0) &&
	// 			this._isEqual(this.c, 0) &&
	// 			this._isEqual(this.d, 1) &&
	// 			this._isEqual(this.e, 0) &&
	// 			this._isEqual(this.f, 0));
	// },
	// public function applyToPoint()
	// /**
	//  * Interpolate this matrix with another and produce a new matrix.
	//  * t is a value in the range [0.0, 1.0] where 0 is this instance and
	//  * 1 is equal to the second matrix. The t value is not constrained.
	//  *
	//  * Context from parent matrix is not applied to the returned matrix.
	//  *
	//  * @param {Matrix} m2 - the matrix to interpolate with.
	//  * @param {number} t - interpolation [0.0, 1.0]
	//  * @returns {Matrix} - new instance with the interpolated result
	//  */
	// interpolate: function(m2, t) {
	// 	var m = new Matrix();
	// 	m.a = this.a + (m2.a - this.a) * t;
	// 	m.b = this.b + (m2.b - this.b) * t;
	// 	m.c = this.c + (m2.c - this.c) * t;
	// 	m.d = this.d + (m2.d - this.d) * t;
	// 	m.e = this.e + (m2.e - this.e) * t;
	// 	m.f = this.f + (m2.f - this.f) * t;
	// 	return m;
	// },
}

/**
 * 2D transformation matrix object initialized with identity matrix.
 *
 * The matrix can synchronize a canvas context by supplying the context
 * as an argument, or later apply current absolute transform to an
 * existing context.
 */
typedef AffineMatrix = {
	/**scale x**/
	public var a:Float;

	/**skew y**/
	public var b:Float;

	/**skew x**/
	public var c:Float;

	/**scale y**/
	public var d:Float;

	/**translate x**/
	public var e:Float;

	/**translate y**/
	public var f:Float;
}

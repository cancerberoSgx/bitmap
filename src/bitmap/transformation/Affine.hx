package bitmap.transformation;

import bitmap.*;
import haxe.io.UInt16Array;

typedef AffineOptions = {
	> Transform.TransformationOptions,
	@:optional var matrix:AffineMatrix;
	@:optional var affine:Affine;
	@:optional var region:Types.Rectangle;
}

/**
 * 2D transformation matrix object initialized with identity matrix.
 *
 * The matrix can synchronize a canvas context by supplying the context
 * as an argument, or later apply current absolute transform to an
 * existing context.
 */
class Affine {
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

	public function new() {
		var matrix = identity();
		a = matrix.a;
		b = matrix.b;
		c = matrix.c;
		d = matrix.d;
		e = matrix.e;
		f = matrix.f;
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
	public function transformMatrix(m:AffineMatrix) {
		var a1 = a, b1 = b, c1 = c, d1 = d, e1 = e, f1 = f;
		/* matrix order (canvas compatible):
		 * ace
		 * bdf
		 * 001
		 */
		a = a1 * m.a + c1 * m.b;
		b = b1 * m.a + d1 * m.b;
		c = a1 * m.c + c1 * m.d;
		d = b1 * m.c + d1 * m.d;
		e = a1 * m.e + c1 * m.f + e1;
		f = b1 * m.e + d1 * m.f + f1;
		return this;
	}

	/**
	 * Assign this affine to given matrix.
	 */
	public function assign(m:AffineMatrix) {
		a = m.a;
		b = m.b;
		c = m.c;
		d = m.d;
		e = m.e;
		f = m.f;
		return this;
	}

	/**
	 * Rotates current matrix accumulative by angle.
	 * @param angle - angle in radians
	 */
	public function rotate(angle:Float) {
		var cos = Math.cos(angle), sin = Math.sin(angle);
		transformMatrix({
			a: cos,
			b: sin,
			c: -sin,
			d: cos,
			e: 0,
			f: 0
		});
		return this;
	}

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
			x: Math.round(x * a + y * c + e),
			y: Math.round(x * b + y * d + f)
		};
	}

	public function transform(o:AffineOptions) {
		// var output = o.output ==null ? o.bitmap.clone() : o.output;
		// Sure.sure(o.bitmap.width==output.width&&o.input.height==output.height);
		// matrix=o.matrix;
		a = o.matrix.a;
		b = o.matrix.b;
		c = o.matrix.c;
		d = o.matrix.d;
		e = o.matrix.e;
		f = o.matrix.f;
		var output = o.bitmap.clone(); // we need to work on a copy always
		for (y in 0...o.bitmap.height) {
			for (x in 0...o.bitmap.width) {
				var p = applyToPoint(x, y);
				output.set(p.x, p.y, o.bitmap.get(x, y), true);
			}
		}
		// TODO: o.modify
		return {
			bitmap: output,
			affine: this
		}
	}

	/**
	 * Apply current matrix to array with point objects or point pairs.
	 * Returns a new array with points in the same format as the input array.
	 *
	 * A point object is an object literal:
	 *
	 * {x: x, y: y}
	 *
	 * so an array would contain either:
	 *
	 * [{x: x1, y: y1}, {x: x2, y: y2}, ... {x: xn, y: yn}]
	 *
	 * or
	 * [x1, y1, x2, y2, ... xn, yn]
	 *
	 * @param points - array with point objects or pairs
	 * @returns  A new array with transformed points
	 */
	public function applyToPoints(points:Array<Types.Point>) {
		var i = 0, p:Types.Point, l:Int, mxPoints:Array<Types.Point> = [];
		l = points.length;
		while (i < l) {
			var p2 = points[i++];
			p = this.applyToPoint(p2.x, p2.y);
			mxPoints.push(p);
		}
		return mxPoints;
	}

	/**
	 * Apply current matrix to a typed array with point pairs. Although
	 * the input array may be an ordinary array, this method is intended
	 * for more performant use where typed arrays are used. The returned
	 * array is regardless always returned as a UInt16Array.
	 *
	 * @param   points   array with point pairs
	 * @returns A new array with transformed points
	 */
	public function applyToArray(points:haxe.io.Int32Array):haxe.io.Int32Array {
		var i = 0, p:Types.Point, l = points.length, mxPoints = new haxe.io.Int32Array(l);
		while (i < l) {
			p = this.applyToPoint(points[i], points[i + 1]);
			mxPoints[i++] = p.x;
			mxPoints[i++] = p.y;
		}
		return mxPoints;
	}

	/**
	 * Returns true if matrix is an identity matrix (no transforms applied).
	 * @returns True if identity (not transformed)
	 */
	public function isIdentity() {
		return a == 1 && b == 0 && c == 0 && d == 1 && e == 0 && f == 0;
	}

	/**
	 * Interpolate this matrix with another and produce a new matrix.
	 * t is a value in the range [0.0, 1.0] where 0 is this instance and
	 * 1 is equal to the second matrix. The t value is not constrained.
	 *
	 * Context from parent matrix is not applied to the returned matrix.
	 *
	 * @param m2 - the matrix to interpolate with.
	 * @param  t - interpolation [0.0, 1.0]
	 * @returns   - new instance with the interpolated result
	 */
	public function interpolate(m2:AffineMatrix, t:Float) {
		var m:AffineMatrix = {
			a: 0,
			b: 0,
			c: 0,
			d: 0,
			e: 0,
			f: 0
		};
		m.a = a + (m2.a - a) * t;
		m.b = b + (m2.b - b) * t;
		m.c = c + (m2.c - c) * t;
		m.d = d + (m2.d - d) * t;
		m.e = e + (m2.e - e) * t;
		m.f = f + (m2.f - f) * t;
		return m;
	}
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

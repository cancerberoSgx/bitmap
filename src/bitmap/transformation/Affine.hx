package bitmap.transformation;

import bitmap.*;

typedef AffineOptions = {
	> Transform.TransformationOptions,
	@:optional var matrix:AffineMatrix;
	@:optional var affine:Affine;
	@:optional var bg:Types.Background;
	@:optional var region:Types.Rectangle;
	@:optional var precision:Bool;
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
	 * Apply current matrix to x and y point.
	 * Returns a point object.
	 *
	 * @param  x - value for x
	 * @param  y - value for y
	 * @returns  A new transformed point object
	 */
	public inline function applyToPoint(x:Float, y:Float) {
		return {
			x: x * a + y * c + e,
			y: x * b + y * d + f
		};
	}

	public function transform(o:AffineOptions) {
		var matrix = o.matrix != null ? o.matrix : o.affine.getMatrix();
		a = matrix.a;
		b = matrix.b;
		c = matrix.c;
		d = matrix.d;
		e = matrix.e;
		f = matrix.f;
		var output = o.output!=null&&o.output!=o.bitmap? o.output : o.bitmap.clone(o.bg == Types.Background.none ? null : true);
		for (y in 0...o.bitmap.height) {
			for (x in 0...o.bitmap.width) {
				var p = applyToPoint(x, y);
				if (p.x >= 0 && p.x < output.width && p.y >= 0 && p.y < output.height) {
					var x2 = Math.floor(p.x), y2 = Math.floor(p.y);
					if (o.precision && o.bg != Types.Background.none) {
						if (output.get(x2, y2, true) != o.bitmap.bg) {
							x2 = Math.round(p.x);
						}
						if (output.get(x2, y2, true) != o.bitmap.bg) {
							y2 = Math.round(p.y);
						}
					}
					output.set(x2, y2, o.bitmap.get(x, y), true);
				}
			}
		}
    if(o.output==o.bitmap) {
      o.output.copyFrom(output);
    }
		return {
			bitmap: output,
			affine: this
		}
	}

	/**
	 * Multiplies current matrix with new matrix values.
	 */
	public function transformMatrix(a2:Float, b2:Float, c2:Float, d2:Float, e2:Float, f2:Float) {
		var a1 = a, b1 = b, c1 = c, d1 = d, e1 = e, f1 = f;
		a = a1 * a2 + c1 * b2;
		b = b1 * a2 + d1 * b2;
		c = a1 * c2 + c1 * d2;
		d = b1 * c2 + d1 * d2;
		e = a1 * e2 + c1 * f2 + e1;
		f = b1 * e2 + d1 * f2 + f1;
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

	public function getMatrix() {
		return {
			a: a,
			b: b,
			c: c,
			d: d,
			e: e,
			f: f
		};
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
			a: 0.0,
			b: 0.0,
			c: 0.0,
			d: 0.0,
			e: 0.0,
			f: 0.0
		};
		m.a = a + (m2.a - a) * t;
		m.b = b + (m2.b - b) * t;
		m.c = c + (m2.c - c) * t;
		m.d = d + (m2.d - d) * t;
		m.e = e + (m2.e - e) * t;
		m.f = f + (m2.f - f) * t;
		return m;
	}

	/**
	 * Rotates current matrix accumulative by angle.
	 * @param angle - angle in radians
	 */
	public function rotate(angle:Float) {
		var cos = Math.cos(angle), sin = Math.sin(angle);
		return transformMatrix(cos, sin, -sin, cos, 0, 0);
	}

	/**
	 * Helper method to make a rotation based on an angle in degrees.
	 * @param  angle - angle in degrees
	 */
	public function rotateDeg(angle:Float) {
		return rotate(angle * 0.017453292519943295);
	}

	/**
	 * Translate current matrix accumulative.
	 * @param tx - translation for x
	 * @param ty - translation for y
	 */
	public function translate(tx:Float, ty:Float) {
		return transformMatrix(1, 0, 0, 1, tx, ty);
	}

	/**
	 * Translate current matrix on x axis accumulative.
	 * @param tx - translation for x
	 */
	public function translateX(tx:Float) {
		return transformMatrix(1, 0, 0, 1, tx, 0);
	}

	/**
	 * Translate current matrix on y axis accumulative.
	 * @param ty - translation for y
	 */
	public function translateY(ty:Float) {
		return transformMatrix(1, 0, 0, 1, 0, ty);
	}

	/**
	 * Flips the vertical values.
	 */
	public function flipY() {
		return transformMatrix(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
	}

	/**
	 * Flips the horizontal values.
	 */
	public function flipX() {
		return transformMatrix(-1.0, 0.0, 0.0, 1.0, 0.0, 0.0);
	}

	/**
	 * Scales current matrix accumulative.
	 * @param sx - scale factor x (1 does nothing)
	 * @param sy - scale factor y (1 does nothing)
	 */
	public function scale(sx:Float, sy:Float) {
		transformMatrix(sx, 0, 0, sy, 0, 0);
		return this;
	}

	/**
	 * Scales current matrix on x axis accumulative.
	 * @param sx - scale factor x (1 does nothing)
	 */
	public function scaleX(sx:Float) {
		transformMatrix(sx, 0, 0, 1, 0, 0);
		return this;
	}

	/**
	 * Scales current matrix on y axis accumulative.
	 * @param sy - scale factor y (1 does nothing)
	 */
	public function scaleY(sy:Float) {
		return transformMatrix(1, 0, 0, sy, 0, 0);
	}

	/**
	 * Apply skew to the current matrix accumulative.
	 * @param sx - amount of skew for x
	 * @param sy - amount of skew for y
	 */
	public function skew(sx:Float, sy:Float) {
		return transformMatrix(1, sy, sx, 1, 0, 0);
	}

	/**
	 * Apply skew for x to the current matrix accumulative.
	 * @param sx - amount of skew for x
	 */
	public function skewX(sx:Float) {
		return transformMatrix(1, 0, sx, 1, 0, 0);
	}

	/**
	 * Apply skew for y to the current matrix accumulative.
	 * @param sy - amount of skew for y
	 */
	public function skewY(sy:Float) {
		return transformMatrix(1, sy, 0, 1, 0, 0);
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
	 * [{x: x1, y: y1} {x: x2, y: y2} ... {x: xn, y: yn}]
	 *
	 * or
	 * [x1, y1, x2, y2, ... xn, yn]
	 *
	 * @param points - array with point objects or pairs
	 * @returns  A new array with transformed points
	 */
	public function applyToPoints(points:Array<Types.FloatPoint>) {
		var i = 0, p:Types.FloatPoint, l:Int, mxPoints:Array<Types.FloatPoint> = [];
		l = points.length;
		while (i < l) {
			var p2 = points[i++];
			p = this.applyToPoint(p2.x*1.0, p2.y*1.0);
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
		var i = 0, p:Types.FloatPoint, l = points.length, mxPoints = new haxe.io.Int32Array(l);
		while (i < l) {
			p = this.applyToPoint(points[i], points[i + 1]);
			mxPoints[i++] = Math.round(p.x);
			mxPoints[i++] = Math.round(p.y);
		}
		return mxPoints;
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

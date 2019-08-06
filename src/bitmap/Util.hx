package bitmap;

import bitmap.*;

/**
 * Utility functions.
 * Adapted from https://github.com/Tw1ddle/geometrize-haxe/
 */
@:expose class Util {
	/**
	 * Clamps a value within a range.
	 * @param	value	The value to clamp.
	 * @param	min	The lower bound of the range.
	 * @param	max	The upper bound of the range.
	 * @return	The clamped value.
	 */
	public static inline function clamp(value:Int, min:Int, max:Int):Int {
		return value < min ? min : value > max ? max : value;
	}

	public static function printRectangle(r:Types.Rectangle) {
		return 'Rectangle(${r.x}, ${r.y}, ${r.width}, ${r.height})';
	}

	/**
	 * Compares two values and returns the smaller one.
	 * @param	first	The first value.
	 * @param	second	The second value.
	 * @return	The smaller value.
	 */
	public static inline function min(first:Int, second:Int):Int {
		return first < second ? first : second;
	}

	/**
	 * Compare two values and returns the larger one.
	 * @param	first	The first value.
	 * @param	second	The second value.
	 * @return	The larger value.
	 */
	public static inline function max(first:Int, second:Int):Int {
		return first > second ? first : second;
	}

	/**
	 * Returns the absolute value of the given value.
	 * @param	value The value to abs.
	 * @return	The absolute value of the given value.
	 */
	public static inline function abs(value:Int) {
		return value < 0 ? -value : value;
	}

	public static inline function sgn(value:Int) {
		return value < 0 ? -1 : value > 0 ? 1 : 0;
	}

	/**
	 * Converts a value measured in degrees to radians.
	 * @param	degrees	Degrees value to convert to radians.
	 * @return	The value converted to radians.
	 */
	public static inline function toRadians(degrees:Float):Float {
		return degrees * Math.PI / 180;
	}

	/**
	 * Converts a value measured in radians to degrees.
	 * @param	radians	Radians value to convert to degrees.
	 * @return	The value converted to degrees.
	 */
	public static inline function toDegrees(radians:Float):Float {
		return radians * 180 / Math.PI;
	}

	/**
	 * Converts a value measured in radians to degrees.
	 * @param	radians	Radians value to convert to degrees.
	 * @return	The value converted to degrees.
	 */
	public static inline function parseIntOrThrow(s:String):Int {
		var i = Std.parseInt(s);
		if (Math.isNaN(i)) {
			throw "Expected " + s + " to be parsable as integer";
		}
		return Math.round(i);
	}

	/**
	 * Returns a random integer in the range (inclusive).
	 * @param	lower	The lower bound.
	 * @param	upper	The upper bound.
	 * @return	A random integer in the range [lower:upper] inclusive.
	 */
	public inline static function random(lower:Float, upper:Float):Int {
		return Math.round((upper - lower) * Math.random() + lower);
	}

	/**
	 * Returns a random array of integers in the range (inclusive).
	 * @param	lower	The lower bound.
	 * @param	upper	The upper bound.
	 * @return	An array of random integers in the range [lower:upper] inclusive.
	 */
	public inline static function randomIntArray(length:Int, lower:Int, upper:Int, noRepeat = false) {
		Sure.sure(length < upper - lower + 1);
		var a:Array<Int> = [], r = random(lower, upper);
		for (i in 0...length) {
			while (a.filter(function(n) return n == r).length != 0) {
				r = random(lower, upper);
			}
			a.push(r);
		}
		return a;
	}

	public inline static function randomRectangle(r:Types.Rectangle) {
		var w = r.width / 2, h = r.height / 2;
		return {
			x: random(0, w),
			y: random(0, h),
			width: random(0, w),
			height: random(0, h)
		};
	}

	public static function multiply(a:Array<Array<Float>>, b:Array<Array<Float>>) {
		var aNumRows = a.length, aNumCols = a[0].length, bNumRows = b.length, bNumCols = b[0].length, m = [for (i in 0...aNumRows) [i * 1.0]];
		for (r in 0...aNumRows) {
			m[r] = [for (i in 0...bNumRows) i * 1.0];
			for (c in 0...bNumCols) {
				m[r][c] = 0.0;
				for (i in 0...aNumCols) {
					m[r][c] = m[r][c] + a[r][i] * b[i][c];
				}
			}
		}
		return m;
	}

	public static function dist(x:Int, y:Int) {
		return x < y ? y - x : x - y;
	}

	public static function urlToBase64(s:String) {
		return s.substring(s.indexOf(';base64,') + ';base64,'.length);
	}

	/**
	 * Returns a random item from an array.
	 * @param	a	The array to pick a random item from.
	 * @return	A random item from the array.
	 */
	public static function randomArrayItem<T>(a:Array<T>):T {
		Sure.sure(a != null && a.length > 0);
		return a[random(0, a.length - 1)];
	}

	/**
	 * Returns the smallest and largest items from an array of ints.
	 * @param	a	The array of ints.
	 * @return	The smallest and largest items from the array.
	 */
	public static inline function minMaxElements(a:Array<Int>) {
		if (a == null || a.length == 0) {
			return {min: 0, max: 0};
		}
		var min:Int = a[0];
		var max:Int = a[0];
		for (value in a) {
			if (min > value) {
				min = value;
			}
			if (max < value) {
				max = value;
			}
		}
		return {min: min, max: max};
	}
}

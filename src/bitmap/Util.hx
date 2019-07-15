package bitmap;

import bitmap.*;

/**
 * Utility functions.
 * Adapted from https://github.com/Tw1ddle/geometrize-haxe/
 */
class Util {
	/**
	 * Clamps a value within a range.
	 * @param	value	The value to clamp.
	 * @param	min	The lower bound of the range.
	 * @param	max	The upper bound of the range.
	 * @return	The clamped value.
	 */
	public static inline function clamp(value:Int, min:Int, max:Int):Int {
		// Sure.sure(min <= max);
		return value < min ? min : value > max ? max : value;
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
	 * Returns a random integer in the range (inclusive).
	 * @param	lower	The lower bound.
	 * @param	upper	The upper bound.
	 * @return	A random integer in the range [lower:upper] inclusive.
	 */
	public static inline function random(lower:Float, upper:Float):Int {
		// Sure.sure(lower <= upper);
		return Math.floor(lower + upper - lower + 1 * Math.random());
	}
	/**
	 * Returns a random array of integers in the range (inclusive).
	 * @param	lower	The lower bound.
	 * @param	upper	The upper bound.
	 * @return	An array of random integers in the range [lower:upper] inclusive.
	 */
	public static inline function randomIntArray(length:Int, lower:Int, upper:Int) {
		var a: Array<Int>=[];
    for(i in 0...length){
      a.push(random(lower, upper));
    }
    return a;
	}

  public static inline function  randomRectangle(r:Types.Rectangle) {
    var w = r.width/2, h = r.height/2;
    return {x: random(0, w), y: random(0, h), width:random(0, w), height: random(0, h) };
  }

  public static function multiply(a:Array<Array<Float>>, b:Array<Array<Float>>) {
  var aNumRows = a.length, aNumCols = a[0].length, bNumRows = b.length, bNumCols = b[0].length, m =[for (i in 0...aNumRows) [i*1.0]] ;  // initialize array of rows
  for (r in 0...aNumRows) {
    m[r] = [for (i in 0...bNumRows) i*1.0]; // initialize the current row
    for (c in 0...bNumCols) {
      m[r][c] = 0.0;             // initialize the current cell
      for (i in 0...aNumCols) {
        m[r][c] = m[r][c] + a[r][i] * b[i][c];
      }
    }
  }
  return m;
}

public static inline function dist(x:Int,y:Int) {
		return x<y ? y-x : x-y;
	}


	/**
	 * Returns a random item from an array.
	 * @param	a	The array to pick a random item from.
	 * @return	A random item from the array.
	 */
	public static inline function randomArrayItem<T>(a:Array<T>):T {
		Sure.sure(a != null && a.length > 0);
		return a[random(0, a.length - 1)];
	}
	/**
	 * Returns the smallest and largest items from an array of ints.
	 * @param	a	The array of ints.
	 * @return	The smallest and largest items from the array.
	 */
	public static inline function minMaxElements(a:Array<Int>)  {
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

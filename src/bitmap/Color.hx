package bitmap;

/**
 * Represents a color in RGBA8888 format with underlying type Int.
 * @author Sam Twidale (http://samcodes.co.uk/)
 */
@:expose abstract Color(UInt) from Int from UInt to UInt {
	/**
	 * Red color component.
	 */
	public var r(get, set):UInt;

	/**
	 * Green color component.
	 */
	public var g(get, set):UInt;

	/**
	 * Blue color component.
	 */
	public var b(get, set):UInt;

	/**
	 * Alpha color component.
	 */
	public var a(get, set):UInt;

	/**
	 * Creates a new color.
	 * @param	rgba	The color value. It will be interpreted in RGBA8888 format.
	 */
	public inline function new(rgba:UInt) {
		this = rgba;
	}

	/**
	 * Creates a new color.
	 * @param	red	The red component (0-255).
	 * @param	green	The green component (0-255).
	 * @param	blue	The blue component (0-255).
	 * @param	alpha	The alpha component (0-255).
	 * @return	The new color value in RGBA8888 format.
	 */
	public static inline function create(red:UInt, green:UInt, blue:UInt, alpha:UInt):Color {
		return (Util.clamp(red, 0, 255) << 24) + (Util.clamp(green, 0, 255) << 16) + (Util.clamp(blue, 0, 255) << 8) + Util.clamp(alpha, 0, 255);
	}

	@:from
	static public function fromString(s:String) {
		if (s.indexOf("#") == 0)
			return new Color(Std.parseInt("0x" + s.substring(1, s.length)));
		else if (s.indexOf("0x") == 0)
			return new Color(Std.parseInt(s));
		// unable to parse
		return new Color(0);
	}

	/**
	 * Converts an integer to a RGBA8888 color.
	 * @param	rgba The integer to convert to the color.
	 * @return	The RGBA color.
	 */
	@:from public static inline function fromInt(rgba:UInt):Color {
		return rgba;
	}

	public function toString() {
		return "0x" + StringTools.hex(this, 8);
	}

	private inline function get_r():UInt {
		return (this >> 24) & 0xFF;
	}

	private inline function get_g():UInt {
		return (this >> 16) & 0xFF;
	}

	private inline function get_b():UInt {
		return (this >> 8) & 0xFF;
	}

	private inline function get_a():UInt {
		return this & 0xFF;
	}

	inline function set_r(value:UInt):UInt {
		this = (value << 24) | (g << 16) | (b << 8) | a;
		return value;
	}

	inline function set_g(value:UInt):UInt {
		this = (r << 24) | (value << 16) | (b << 8) | a;
		return value;
	}

	inline function set_b(value:UInt):UInt {
		this = (r << 24) | (g << 16) | (value << 8) | a;
		return value;
	}

	inline function set_a(value:UInt):UInt {
		this = (r << 24) | (g << 16) | (b << 8) | value;
		return value;
	}

	// won't be needed when Haxe 4.3.0 makes it into widespread usage
	private var self(get, never): Color;
	private function get_self(): Color return this;

	// see https://en.wikipedia.org/wiki/Alpha_compositing
	public function blendWithAlpha(other: Color): Color {
		var alphaCorrected = (self.a/255) * (1 - other.a/255);
		var resultAlpha = other.a/255 + alphaCorrected;
		var resultR = (other.r * other.a/255 + self.r * alphaCorrected) / resultAlpha;
		var resultG = (other.g * other.a/255 + self.g * alphaCorrected) / resultAlpha;
		var resultB = (other.b * other.a/255 + self.b * alphaCorrected) / resultAlpha;

		return Color.create(Std.int(resultR), Std.int(resultG), Std.int(resultB), Std.int(resultAlpha*255));
	}
}

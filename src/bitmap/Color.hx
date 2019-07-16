package bitmap;

/**
 * Represents a color in RGBA8888 format with underlying type Int.
 * @author Sam Twidale (http://samcodes.co.uk/)
 */
abstract Color(UInt) from Int from UInt to UInt {
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
		// return (this & 0x00ff0000) >>> 16;
	}

	private inline function get_g():UInt {
		return (this >> 16) & 0xFF;
		// return (this & 0x0000ff00) >>> 8;
	}

	private inline function get_b():UInt {
		return (this >> 8) & 0xFF;
		// return this & 0x000000ff;
	}

	private inline function get_a():UInt {
		return this & 0xFF;
		// return this >>> 24;
	}

	inline function set_r(value:UInt):UInt {
		// this = (a << 24) | (value << 16) | (g << 8) | b;
		this = (value << 24) | (g << 16) | (b << 8) | a;
		// return (this >> 24) & 0xFF;
		return value;
	}

	inline function set_g(value:UInt):UInt {
		this = (r << 24) | (value << 16) | (b << 8) | a;
		// this = (a << 24) | (r << 16) | (value << 8) | b;
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
}

package bitmap;

import haxe.io.Input;
import bitmap.*;
import bitmap.transformation.*;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
	/**
	 * If true operationsn won't throw exceptions in case given coordinates for get/set are outside de bitmap.
	**/
	public var noRangeCheck = false;

	/**
	 * Switch between byte-by-byte and int32 modalities for reading and writing pixels with get/set.
	**/
	public var int32Mode = false;
	public var data:Bytes;
	public var width:Int;
	public var height:Int;
	public var originalWidth:Int;
	public var originalHeight:Int;
	public var format:Types.PixelFormat;
	public var draw:Draw;
	public var transform:Transform;

	public function new(w:Int = 0, h:Int = 0, f:Types.PixelFormat = Types.PixelFormat.RGBA) {
		draw = new Draw(this);
		transform = new Transform(this);
		if (w > 0 && h > 0) {
			width = w;
			height = h;
			data = Bytes.alloc(w * h * 4);
			format = f;
			draw.rectangle({
				width: w - 1,
				height: h - 1,
				x: 0,
				y: 0,
				fill: true,
				blend: Types.Blend.none,
				c: Color.create(255, 255, 255, 255)
			});
		}
	}

	public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		if (i < 0 || i > data.length - 4) {
			if (!noRangeCheck) {
				Sure.sure('outOfBounds' == null);
			} else {
				return 0;
			}
		}
		return int32Mode ? getInt32(i) : getInt8(i);
	}

	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool {
		var i = (y * width + x) * 4;
		if (i < 0 || i >= data.length - 5) {
			if (!noRangeCheck && noError != true) {
				Sure.sure('outOfBounds' == null);
			} else {
				return true;
			}
		}
		if (int32Mode) {
			setInt32(i, c);
		} else {
			setInt8(i, c);
		}
		return false;
	}

	public function load(input:Input, ?f:Types.PixelFormat):Void {
		throw "Abstract method call";
	}

	public function save(output:Output):Void {
		throw "Abstract method call";
	}

	public function clone() {
		var bitmap = new PNGBitmap();
		bitmap.width = width;
		bitmap.height = height;
		bitmap.format = format;
		bitmap.data = data.sub(0, data.length);
		return bitmap;
	}

	public function equals(b:Bitmap):Bool {
		return BitmapUtil.bitmapEquals(this, b);
	}

	public function copyFrom(b:Bitmap, ?region:Types.Rectangle) {
		if (region == null) {
			region = {
				x: 0,
				y: 0,
				width: Util.min(width, b.width),
				height: Util.min(height, b.height)
			};
		}
		for (x in region.x...region.width) {
			for (y in region.y...region.height) {
				set(x, y, b.get(x, y));
			}
		}
	}

	/** 
		* This invert the four bytes order in the Int32. For some reason this is needed in order to write a whole Int32 ,instead separated bytes, which is faster.

		I suspect this class (taken from geometrize-haxe project) is currently storing the bytes not rgba but abgr (reversed) and since colors are in general accessed byte by byte is not noticed.

		TODO: Si the previous is correct, this method should not be needed. Change the order in create() and r, b, g, a props.
	**/
	private inline function setInt32(i:Int, c:Color) {
		data.setInt32(i, (c >> 24 & 0x000000FF) + (c >> 8 & 0x0000ff00) + ((c & 0x0000ff00) << 8) + ((c & 0x000000FF) << 24));
	}

	private inline function setInt8(i:Int, c:Color) {
		data.set(i, c.r);
		data.set(i + 1, c.g);
		data.set(i + 2, c.b);
		data.set(i + 3, c.a);
	}

	private inline function getInt32(i:Int) {
		var c = data.getInt32(i);
		return ((c >> 24) & 0xFF) + (((c >> 16) & 0xFF) << 8) + (((c >> 8) & 0xFF) << 16) + ((c & 0xff) << 24);
	}

	private inline function getInt8(i:Int) {
		return Color.create(data.get(i), data.get(i + 1), data.get(i + 2), data.get(i + 3));
	}
}

package bitmap;

import haxe.io.*;
import bitmap.*;
import bitmap.transformation.*;

@:expose @:abstract class AbstractBitmap implements Bitmap {
	public var noRangeCheck = true;

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
	public var io:BitmapIO;
	public var color:Colors;
	public var transform:Transform;
	public var bg = Color.create(255, 255, 255, 255);

	public function new(w:Int = 1, h:Int = 1, f:Types.PixelFormat = Types.PixelFormat.RGBA) {
		draw = new Draw(this);
		transform = new Transform(this);
		color = new Colors(this);
		io = new BitmapIO(this);
		if (w > 0 && h > 0) {
			width = w;
			height = h;
			data = Bytes.alloc(w * h * 4);
			format = f;
			fill();
		}
	}

	public function fill(?bg_:Color) {
		bg_ = bg_ == null ? bg : bg_;
		for (x in 0...width) {
			for (y in 0...height) {
				set(x, y, bg_);
			}
		}
	}

	public function get(x:Int, y:Int, ?noError:Bool):Color {
		var i = byteIndex(x, y);
		if (i < 0 || i > data.length - 4) {
			if (!noRangeCheck && !noError) {
				Sure.sure('get outOfBounds' == null);
			} else {
				return bg;
			}
		}
		return int32Mode ? getInt32(i) : getInt8(i);
	}

	public function toString() {
		return 'Bitmap(' + Util.printRectangle(bounds()) + ')';
	}

	public inline function byteIndex(x:Int, y:Int) {
		return (width * y + x) << 2;
	}

	public function copy(r:Types.Rectangle):Bitmap {
		throw "Abstract method call";
	}

	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool {
		var i = byteIndex(x, y);
		if (i < 0 || i > data.length - 4) {
			if (!noRangeCheck && noError != true) {
				Sure.sure('set outOfBounds' == null);
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

	public function clone(?fill_ = false) {
		var bitmap = new PNGBitmap();
		bitmap.width = width;
		bitmap.height = height;
		bitmap.format = format;
		bitmap.noRangeCheck = noRangeCheck;

		if (!fill_) {
			bitmap.data = data.sub(0, data.length);
		} else {
			bitmap.data = Bytes.alloc(data.length);
			bitmap.fill();
		}
		return bitmap;
	}

	public inline function equals(b:Bitmap, ?region:Types.Rectangle):Bool {
		return BitmapUtil.bitmapEquals(this, b, region);
	}

	public function copyFrom(b:Bitmap, bCoords:Types.Point, regionThis:Types.Rectangle):Void {
		// TODO: check bounds
		for (y in 0...regionThis.height) {
			for (x in 0...regionThis.width) {
				set(regionThis.x + x, regionThis.y + y, b.get(bCoords.x + x, bCoords.y + y));
			}
		}
	}

	public function compare(b:Bitmap, ?regionB:Types.Rectangle, ?thisRegion:Types.Rectangle):Float {
		return BitmapUtil.compare(this, b, regionB, thisRegion);
	}

	public function bounds():Types.Rectangle {
		return {
			x: 0,
			y: 0,
			width: width,
			height: height
		};
	}

	/**
		Enlarges the bounds of this bitmap by the specified amounts.
		The newly created are is filled with white. The dimensions must
		be larger than the current ones.
	**/
	public function increaseBounds(incrWidth: Int, incrHeight: Int) {
		var newWidth = width + incrWidth;
		var newHeight = height + incrHeight;
		if (incrWidth < 0 || incrHeight < 0)
			throw "Tried to increaseBounds() with dimensions smaller than the bitmap's";

		var newData = Bytes.alloc(newWidth * newHeight * 4);
		// fill with white
		newData.fill(0, newData.length, 255);

		if (newWidth == width) {
			// if we only increase height, this is much faster
			newData.blit(0, data, 0, data.length);
		} else {
			// if we increase width, we have to copy the data row by row
			for (y in 0...height) {
				newData.blit(newWidth * y * 4, data, width * y * 4, width * 4);
			}
		}

		width = newWidth;
		height = newHeight;
		data = newData;
	}

	/** 
		* This invert the four bytes order in the Int32. For some reason this is needed in order to write a whole Int32 ,instead separated bytes, which is faster.

		I suspect this class (taken from geometrize-haxe project) is currently storing the bytes not rgba but abgr (reversed) and since colors are in general accessed byte by byte is not noticed.

		TODO: Si the previous is correct, this method should not be needed. Change the order in create() and r, b, g, a props.
	**/
	private inline function setInt32(i:Int, c:Color, ?data_: Bytes) {
		if (data_ == null) data_ = data;
		data_.setInt32(i, (c >> 24 & 0x000000FF) + (c >> 8 & 0x0000ff00) + ((c & 0x0000ff00) << 8) + ((c & 0x000000FF) << 24));
	}

	private inline function setInt8(i:Int, c:Color, ?data_: Bytes) {
		if (data_ == null) data_ = data;
		data_.set(i, c.r);
		data_.set(i + 1, c.g);
		data_.set(i + 2, c.b);
		data_.set(i + 3, c.a);
	}

	private inline function getInt32(i:Int, ?data_: Bytes) {
		if (data_ == null) data_ = data;
		var c = data_.getInt32(i);
		return ((c >> 24) & 0xFF) + (((c >> 16) & 0xFF) << 8) + (((c >> 8) & 0xFF) << 16) + ((c & 0xff) << 24);
	}

	private inline function getInt8(i:Int, ?data_: Bytes) {
		if (data_ == null) data_ = data;
		return Color.create(Bytes.fastGet(data_.getData(), i), Bytes.fastGet(data_.getData(), i + 1), Bytes.fastGet(data_.getData(), i + 2),
			Bytes.fastGet(data_.getData(), i + 3));
	}
}

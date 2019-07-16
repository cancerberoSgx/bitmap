package bitmap;

import haxe.io.Input;
import bitmap.*;
import bitmap.transformation.*;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
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

	public inline function byteIndex(x:Int, y:Int) {
		return (y * width + x) * 4;
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

	public function copyFrom(b:Bitmap, regionB:Types.Rectangle, regionThis:Types.Rectangle) {
		if (regionThis.width != regionB.width || regionThis.height != regionB.height) {
      trace(regionB, regionThis);
			throw "Regions have different sizes";
		}
    for(y in 0...regionB.height){
      for(x in 0...regionB.width){
        set(regionThis.x+x, regionThis.y+y, b.get(regionB.x+x, regionB.y+y));
      }
    }
		// regionB = regionB == null ? regionThis == null ? b.bounds() : regionThis : regionB;
		// regionThis = regionThis == null ? regionB == null ? this.bounds() : regionB : regionThis;

		// regionB.width = regionB.width + regionB.x > b.width ? b.width - regionB.x - 1 : regionB.width;
		// regionB.height = regionB.height + regionB.y > b.height ? b.height - regionB.y - 1 : regionB.height;

		// regionThis.width = regionThis.width + regionThis.x > this.width ? this.width - regionThis.x - 1 : regionThis.width;
		// regionThis.height = regionThis.height + regionThis.y > this.height ? this.height - regionThis.y - 1 : regionThis.height;


		// Sure.sure(b.width >= regionB.x + regionB.width && b.height >= regionB.y + regionB.height);
		// Sure.sure(width >= regionThis.x + regionThis.width && height >= regionThis.y + regionThis.height);

// 		var startB = (cast b).byteIndex(regionB.x, regionB.y);
// 		var endB = (cast b).byteIndex(regionB.x + regionB.width - 1, regionB.y + regionB.height - 1);

// 		var startThis = (cast b).byteIndex(regionThis.x, regionThis.y);
// 		var endThis = (cast b).byteIndex(regionThis.x + regionThis.width - 1, regionThis.y + regionThis.height - 1);
// trace(startB, endB, startThis, endThis);
// // var len = b.length<endB
// 		// data.blit(startThis, b.data, startB, Util.min(endThis - startThis, endB - startB)-1);
// 		data.blit(startThis, b.data, startB, Util.min(Util.min(endB - startB, b.data.length-1),Util.min(data.length-startThis, endThis-startThis)));
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
		return Color.create(Bytes.fastGet(data.getData(), i), Bytes.fastGet(data.getData(), i + 1), Bytes.fastGet(data.getData(), i + 2),
			Bytes.fastGet(data.getData(), i + 3));
		// return Color.create(data.get(i), data.get(i + 1), data.get(i + 2), data.get(i + 3));
	}
}

package bitmap;

import haxe.io.Input;
import bitmap.*;
import bitmap.transformation.*;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
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
				c: Color.create(0, 0, 0, 0)
			});
		}
	}

	public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 3);
		if (format == null || format == Types.PixelFormat.RGBA) {
			return Color.create(data.get(i), data.get(i + 1), data.get(i + 2), data.get(i + 3));
		} else if (format == Types.PixelFormat.ARGB) {
			return Color.create(data.get(i), data.get(i + 1), data.get(i + 2), data.get(i + 3));
		} else {
			throw "Image format not supported";
		}
	}

	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool {
		var i = (y * width + x)* 4 ;
		if (i >= data.length - 5) {
			if (noError != true) {
				Sure.sure('outOfBounds'==null);
			} else {
				return true;
			}
		}
		if (format == null || format == Types.PixelFormat.RGBA) {
			data.setInt32(i, c.asInt32());
			// data.set(i + 1, c.g);
			// data.set(i + 2, c.b);
			// data.set(i + 3, c.a);
		} 
    // else if (format == Types.PixelFormat.ARGB) {
		// 	data.set(i, c.a);
		// 	data.set(i + 1, c.r);
		// 	data.set(i + 2, c.g);
		// 	data.set(i + 3, c.b);
		// } 
    else {
			throw "Image format not supported";
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
}

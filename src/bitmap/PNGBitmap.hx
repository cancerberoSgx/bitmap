package bitmap;

// import haxe.io.Input;
import bitmap.*;
import bitmap.Bitmap;
import format.png.Tools;
// import bitmap.AbstractBitmap;

class PNGBitmap extends AbstractBitmap {

	override public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 4);
		if (format == PixelFormat.RGBA) {
			return {
				r: data.get(i++),
				g: data.get(i++),
				b: data.get(i++),
				a: data.get(i++)
			};
		} else if (format == PixelFormat.ARGB) {
			return {
				a: data.get(i++),
				r: data.get(i++),
				g: data.get(i++),
				b: data.get(i++)
			};
		} else {
			throw "Image format not supported";
		}
	}

	override public function set(x:Int, y:Int, c:Color):Void {
    
  }

	override public function load(input:haxe.io.Input, ?f:PixelFormat) {
		if (f == null) {
			f = PixelFormat.RGBA;
		}
		if (f != PixelFormat.RGBA && f != PixelFormat.ARGB) {
			throw "Image format not supported";
		}
		var d = new format.png.Reader(input).read();
		var hdr = Tools.getHeader(d);
		width = hdr.width;
		height = hdr.height;
		format = f;
		data = Tools.extract32(d);
		Tools.reverseBytes(data);
		if (format == PixelFormat.RGBA) {
			data = PixelFormatUtil.argbToRgba(data);
		}
	}

	override public function save(format:PixelFormat): haxe.io.Output {
		throw "not impl";
	}

	public static function crete(input:haxe.io.Input, ?format:PixelFormat)	{
    var bitmap = new PNGBitmap();
		bitmap.load(input, format);
		return bitmap;
	}

}

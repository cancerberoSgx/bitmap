package bitmap;

import haxe.io.Input;
import bitmap.PixelFormatUtil;
import bitmap.Bitmap;
import haxe.io.Output;
import format.png.Tools;
import haxe.io.Bytes;

class RGBABitmap implements Bitmap {
	@:readOnly public var data:Bytes;
	@:readOnly public var width:Int;
	@:readOnly public var height:Int;
	@:readOnly public var format:ImageFormat;

	public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 4);
		if (format == ImageFormat.PNG_RGBA) {
			return {
				r: data.get(i++),
				g: data.get(i++),
				b: data.get(i++),
				a: data.get(i++)
			};
		} else if (format == ImageFormat.PNG_ARGB) {
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

	public function set(x:Int, y:Int, c:Color):Void {}

	public function load(input:Input, ?f:ImageFormat):Void {
		if (f == null) {
			f = ImageFormat.PNG_RGBA;
		}
		if ((f != ImageFormat.PNG_RGBA && f != ImageFormat.PNG_ARGB)) {
			throw "Image format not supported";
		}
		var data = new format.png.Reader(input).read();
		var hdr = Tools.getHeader(data);
		this.width = hdr.width;
		this.height = hdr.height;
		this.format = f;
		this.data = Tools.extract32(data);
		Tools.reverseBytes(this.data);
		if (format == ImageFormat.PNG_RGBA) {
			this.data = PixelFormatUtil.argbToRgba(this.data);
		}
	}

	public function save(format:ImageFormat):Output {
		throw "not impl";
	}

	public static function crete(input:Input, ?format:ImageFormat) {
		var bitmap = new RGBABitmap();
		bitmap.load(input, format);
		return bitmap;
	}

	private function new() {}
}

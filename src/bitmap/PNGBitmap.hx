package bitmap;

import haxe.io.Output;
import bitmap.*;
import format.png.*;

class PNGBitmap extends AbstractBitmap {
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
			PixelFormatUtil.argbToRgba(data);
		}
	}

	override public function save(output:Output):Void {
		haxeZipCompressJsSupport();
		var copy = data.sub(0, data.length);
		if (format == null || format == PixelFormat.RGBA) {
			copy = PixelFormatUtil.rgbaToArgb(copy);
		}
		var data = Tools.build32ARGB(width, height, copy);
		new Writer(output).write(data);
	}

	public static function create(input:haxe.io.Input, ?format:PixelFormat) {
		var bitmap = new PNGBitmap();
		bitmap.load(input, format);
		return bitmap;
	}

	private static var haxeZipCompressJsSupportOnce = false;

	private static function haxeZipCompressJsSupport() {
		if (haxeZipCompressJsSupportOnce) {
			return;
		}
		haxeZipCompressJsSupportOnce = true;
		#if js
		untyped haxe.zip.Compress.run = function(bytes, level = 9) {
			var data = bytes.getData();
			var data = untyped pako.deflate(data, {level: level});
			return haxe.io.Bytes.ofData(data);
		};
		#end
	}
}

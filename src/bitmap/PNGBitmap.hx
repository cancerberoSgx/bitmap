package bitmap;

import haxe.io.Output;
import bitmap.*;
import bitmap.support.ZipSupport;
import bitmap.Types.PixelFormat;
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
		ZipSupport.haxeZipCompressJsSupport();
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

	override public function copy(?r:Types.Rectangle):Bitmap {
		if (r == null) {
			r = bounds();
		}

		r.width = r.width+r.x> width ? width - r.x -1 : r.width;// Util.min(r.width+r.x, width);
		r.height =r.height+r.y> height ? height - r.y -1 : r.height;//Util.min(r.height+r.y, height);

    // trace(width, r.x + r.width, height,r.y+ r.height);
		Sure.sure(width >= r.x + r.width && height >= r.y + r.height);
		var b = new PNGBitmap(r.width, r.height);
    b.noRangeCheck=noRangeCheck;
		b.copyFrom(this, r);
		return b;
	}
}

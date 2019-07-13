package bitmap;

import haxe.io.Output;
import bitmap.*;
import bitmap.Bitmap;

class RawRgbaBitmap extends AbstractBitmap {

	override public function load(input:haxe.io.Input, ?f:PixelFormat) {
		throw "Operation not supported for this raw RGBA bitmaps";
	}

  override public function save(output:Output):Void{
    output.writeBytes(data, 0, data.length);
  }

	public static function create(input:haxe.io.Input, width: Int, height: Int) {
		var bitmap = new RawRgbaBitmap();
    bitmap.data = input.readAll();
    bitmap.width = width;
    bitmap.height = width;
    bitmap.format = PixelFormat.RGBA;
		return bitmap;
	}
}

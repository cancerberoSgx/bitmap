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
    var bytes = input.readAll();
    Sure.sure(bytes.length==width*height*4);
		var bitmap = new RawRgbaBitmap(width, height);
    bitmap.data = bytes;
		return bitmap;
	}
}

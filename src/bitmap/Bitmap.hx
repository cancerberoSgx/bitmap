package bitmap;

import haxe.io.Input;
import haxe.io.Output;

interface Bitmap {
  public function load(nput:Input, ?format:ImageFormat):Void;
  public function save(format:ImageFormat):Output;
  public function get(x:Int, y:Int):Color;
  public function set(x:Int, y:Int, c:Color):Void;
}

typedef Color = {
  public var r:Int;
  public var g:Int;
  public var b:Int;
  public var a:Int;
};

enum ImageFormat {
  PNG_RGBA;
  PNG_ARGB;
}

// enum PixelFormat {
//   RGBA;
//   ARGB;
// }

// interface ImageHandler {
//   public function read(input:haxe.io.Input):Bitmap
// }
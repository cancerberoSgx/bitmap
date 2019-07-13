package bitmap;

import haxe.io.Input;
import haxe.io.Output;

interface RectangleArea {
  @:readOnly public var width:Int;
	@:readOnly public var height:Int;
}

interface OffsetRectangleArea extends RectangleArea {
  @:readOnly public var originalWidth:Int;
	@:readOnly public var originalHeight:Int;
}

interface Bitmap extends OffsetRectangleArea{
  public function load(nput:Input, ?format:PixelFormat):Void;
  public function save(format:PixelFormat):Output;
  public function get(x:Int, y:Int):Color;
  public function set(x:Int, y:Int, c:Color):Void;
  // public function visit(visitor: ((i:Int,s:Int)->Bool)):Void;
}

typedef Color = {
  public var r:Int;
  public var g:Int;
  public var b:Int;
  public var a:Int;
};

enum PixelFormat {
  RGBA;
  ARGB;
}

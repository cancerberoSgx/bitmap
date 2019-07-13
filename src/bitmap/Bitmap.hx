package bitmap;

import haxe.io.*;

interface RectangleArea {
  @:readOnly public var width:Int;
	@:readOnly public var height:Int;
}

interface OffsetRectangleArea extends RectangleArea {
  @:readOnly public var originalWidth:Int;
	@:readOnly public var originalHeight:Int;
}

interface Bitmap extends OffsetRectangleArea{
  @:readOnly public var data:Bytes;
  public function load(nput:Input, ?format:PixelFormat):Void;
  public function save(output:Output):Void;
  public function get(x:Int, y:Int):Color;
  public function set(x:Int, y:Int, c:Color):Void;
  public function equals(b:Bitmap):Bool;
}

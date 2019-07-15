package bitmap;

import haxe.io.*;
import bitmap.*;
import bitmap.transformation.*;

interface RectangleArea {
	@:readOnly public var width:Int;
	@:readOnly public var height:Int;
}

interface OffsetRectangleArea extends RectangleArea {
	@:readOnly public var originalWidth:Int;
	@:readOnly public var originalHeight:Int;
}

interface Bitmap extends OffsetRectangleArea {
  /**
   * image bitmap Raw bytes in RGBA int32 format.
   **/
	@:readOnly public var data:Bytes;
  /**
   * Drawing utilities.
   **/
	@:readOnly public var draw:Draw;
  /**
   * Transform utilities like convolve, affine, etc.
   **/
	@:readOnly public var transform:Transform;
  /**
   * Loads an image form given input.
   **/
	public function load(input:Input, ?format:Types.PixelFormat):Void;
  /**
   * Saves current bitmap to given output.
   **/
	public function save(output:Output):Void;
  /**
   * Gets pixel color at x,y. 
   * 
   * By default if coords are out of bounds it will throw error. This can be prevented
   * passing noError==true. In that case, if the error happens it will return true, otherwise false.
   **/
	public function get(x:Int, y:Int):Color;
  /**
   * By default if coords are out of bounds it will throw error. This can be prevented
   * passing noError==true. In that case, if the error happens it will return true, otherwise false.
   **/
	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool;
  /**
   * Returns true if this bitmap and given one are exactly equal (pixel by pixel).
   **/
	public function equals(b:Bitmap):Bool;
  /**
   * Returns a new bitmap that is a copy of this one with exactly the same pixels.
   **/
	public function clone():Bitmap;
}

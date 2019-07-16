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
	 * If true operationsn won't throw exceptions in case given coordinates for get/set are outside bitmap.
	**/
	public var noRangeCheck:Bool;

	/**
	 * Drawing utilities.
	**/
	@:readOnly public var draw:Draw;

	/**
	 * Color related utilities like channel filters, blend, etc.
	**/
	@:readOnly public var color:Colors;

	/**
	 * Transform utilities like convolve, affine, etc.
	**/
	@:readOnly public var transform:Transform;

	/**
	 * Utilities to load/save bitmaps from/to other formats or resources, such as base64 dataUrls, raw bytes formats, HTML canvas, HTML images, DOM Blobs, TypedArrays, buffers, urls, etc.
	**/
	@:readOnly public var io:BitmapIO;

	/**
	 * Default color for this bitmap background. It's used in some operations like copy/clone as default background color in some cases.
	**/
	public var bg:Color;

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
	public function get(x:Int, y:Int, ?noError:Bool):Color;

	/**
	 * By default if coords are out of bounds it will throw error. This can be prevented
	 * passing noError==true. In that case, if the error happens it will return true, otherwise false.
	**/
	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool;

	/**
	 * Returns true if this bitmap and given one are exactly equal (pixel by pixel).
	**/
	public function equals(b:Bitmap, ?region:Types.Rectangle):Bool;

	/**
	 * Returns a new bitmap that is a copy of this one with exactly the same pixels.
	**/
	public function clone(?fillBg:Bool):Bitmap;

	/**
	 * Writes in this bitmap given region of given bitmap, or if no region is given, the bitmap entirely.
	**/
 public function copyFrom(b:Bitmap, bCoords:Types.Point, regionThis:Types.Rectangle):Void;
	// public function copyFrom(b:Bitmap, ?region:Types.Rectangle, ?thisRegion:Types.Rectangle):Void;
	public function fill(?bg:Color):Void;
	// public function copy(?r:Types.Rectangle):Bitmap;
  public function copy(r:Types.Rectangle):Bitmap ;
	public function compare(b:Bitmap, ?regionA:Types.Rectangle, ?thisRegion:Types.Rectangle):Float;
	public function bounds():Types.Rectangle;
}

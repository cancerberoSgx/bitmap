package bitmap.text;

import haxe.io.Input;
import bitmap.transformation.Transform.TransformationOptions;

/** options provided by the suer**/
typedef RenderTextOptions = {
	> TransformationOptions,
	> FontOptions,
	> Types.Point,
	// var coords:Types.Point;
	var text:String;
  public var bitmap:Bitmap;
	@:optional var area:Types.OptionalArea;
	@:optional var layout:LayoutOptoins;
	@:optional var throwOnGlyphNotFound:Bool;
};

/**
 * User options with low level information passed form the manager to the renderer.
 */
typedef RenderOptions = {
	> RenderTextOptions,
	var font:Font;
};

typedef LayoutOptoins = {
	@:optional var align:String; // left, right, center, justiry
	@:optional var valign:String; // bottom, top, center
	@:optional var wrap:String; // wrap, noWrap, wrapAtColumn,justify, etc
};

typedef FontOptions = {
	> FontBasicProperties,
	@:optional var weight:Int;
	@:optional var style:FontStyle;
	@:optional var fill:Color;
	@:optional var stroke:Color;
	@:optional var background:Color;
	@:optional var shadow:Color;
	// etc
};

typedef FontBasicProperties = {
	var fontFamily:String;
	@:optional var size:Int;
};

typedef FontDef = {
	> FontBasicProperties,
	var img:Input;
	var fmt:Input;
};

enum FontStyle {
	bold;
	italic;
}

typedef CharDef = {
	var id:Int;
	var text:String;
	var x:Int;
	var y:Int;
	var width:Int;
	var height:Int;
	var xoffset:Int;
	var yoffset:Int;
	var xadvance:Int;
};

typedef Glyph = {
	> CharDef,
	var bitmap:Bitmap;
};

package bitmap;

import haxe.io.Input;
import bitmap.*;
import bitmap.transformation.*;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
	public var data:Bytes;
	public var width:Int;
	public var height:Int;
	public var originalWidth:Int;
	public var originalHeight:Int;
	public var format:Types.PixelFormat;
	public var draw:Draw;
	public var transform:Transform;

	public function new(w:Int = 0, h:Int = 0, f:Types.PixelFormat = Types.PixelFormat.RGBA) {
		draw = new Draw(this);
		transform = new Transform(this);
		if (w > 0 && h > 0) {
			width = w;
			height = h;
			data = Bytes.alloc(w * h * 4);
			format = f;
			draw.rectangle({
				width: w - 1,
				height: h - 1,
				x: 0,
				y: 0,
				fill: true,
				blend: Types.Blend.none,
				c: Color.create(0, 0, 0, 0)
			});
		}
	}
inline function getInt32(i:Int){
  var c = data.getInt32(i);

		return ((c >> 24) & 0xFF) + (((c >> 16) & 0xFF)<< 8) + (((c >> 8) & 0xFF)<<16) + ((c&0xff)<<24);
}
inline function getInt8(i:Int){
		return Color.create(data.get(i), data.get(i + 1), data.get(i + 2), data.get(i + 3));
}
private var int32Mode=false;
	public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 3);
    // return getInt8(i);
    return int32Mode ? getInt32(i): getInt8(i);
	}


  /** 
   * This invert the four bytes order in the Int32. For some reason this is needed in order to write a whole Int32 ,instead separated bytes, which is faster. 

   I suspect this class (taken from geometrize-haxe project) is currently storing the bytes not rgba but abgr (reversed) and since colors are in general accessed byte by byte is not noticed. 

   TODO: Si the previous is correct, this method should not be needed. Change the order in create() and r, b, g, a props.
   **/
inline function setInt32(i:Int, c:Color){
  // data.setInt32(i, c);
			data.setInt32(i, ((c >> 24) & 0xFF) + (((c >> 16) & 0xFF)<< 8) + (((c >> 8) & 0xFF)<<16) + ((c&0xff)<<24));
}

inline function setInt8(i:Int, c:Color){
   data.set(i , c.r);
   data.set(i + 1, c.g);
			data.set(i + 2, c.b);
			data.set(i + 3, c.a);
}

	public function set(x:Int, y:Int, c:Color, ?noError:Bool):Bool {
		var i = (y * width + x)* 4 ;
		if (i >= data.length - 5) {
			if (noError != true) {
				Sure.sure('outOfBounds'==null);
			} else {
				return true;
			}
		}
    if(int32Mode){
      setInt32(i, c);
    }
    else {
        setInt8(i,c);
    } 
    return false;
	}

	public function load(input:Input, ?f:Types.PixelFormat):Void {
		throw "Abstract method call";
	}

	public function save(output:Output):Void {
		throw "Abstract method call";
	}

	public function clone() {
		var bitmap = new PNGBitmap();
		bitmap.width = width;
		bitmap.height = height;
		bitmap.format = format;
		bitmap.data = data.sub(0, data.length);
		return bitmap;
	}

	public function equals(b:Bitmap):Bool {
		return BitmapUtil.bitmapEquals(this, b);
	}
}

package bitmap;
import haxe.io.Input;
import bitmap.*;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
	public var  data:Bytes;
	public var width:Int;
	public var height:Int;
  public var originalWidth:Int;
	public var originalHeight:Int;
	public var format:PixelFormat;
  
	private function new() {}

	 public function get(x:Int, y:Int):Color {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 3);
		if (format==null||format == PixelFormat.RGBA) {
			return Color.create(
			data.get(i),
				data.get(i+1),
				data.get(i+2),
				data.get(i+3)
			);
		} else if (format == PixelFormat.ARGB) {
				return Color.create(
			 data.get(i),
			 data.get(i+1),
			 data.get(i+2),
			 data.get(i+3)
			);
		} else {
			throw "Image format not supported";
		}
	}

	 public function set(x:Int, y:Int, c:Color):Void {
		var i = (y * width + x) * 4;
		Sure.sure(i >= 0 && i < data.length - 3);
		if (format==null||format == PixelFormat.RGBA) {
			data.set(i, c.r);
			data.set(i+1, c.g);
			data.set(i+2, c.b);
			data.set(i+3, c.a);
		} else if (format == PixelFormat.ARGB) {
			data.set(i, c.a);
			data.set(i+1, c.r);
			data.set(i+2, c.g);
			data.set(i+3, c.b);
		} else {
			throw "Image format not supported";
		}
	}


  // public function getData(): Bytes{
  //   var d = Bytes.alloc(data.length);
  //   return data.blit(0, data.length);
  // }
	public function load(input:Input, ?f:PixelFormat):Void{
    throw "Abstract method call";
  }

  public function save(output:Output):Void{
    // output.writeBytes(data, 0, data.length);
    throw "Abstract method call";

  }

  public function equals(b:Bitmap):Bool{
    // we could use compare here
    return BitmapUtil.bitmapEquals(this, b);
  }
//  public function visitData(visitor: ((i:Int,s:Int)->Bool)):Void {
//    for(i in [0...data.length-1]){

//    }
//  }
 
  //  public function visit(visitor:(x:Int,y:Int)->Bool):Void{
    //  if(this.format==PixelFormat.RGBA||this.format==PixelFormat.ARGB) {

    //  }else {
    //    throw "Pixel format not implemented for visit";
    //  }
  //  }
}

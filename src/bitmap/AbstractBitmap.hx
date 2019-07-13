package bitmap;
import haxe.io.Input;
import bitmap.Bitmap;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
	public var data:Bytes;
	public var width:Int;
	public var height:Int;
  public var originalWidth:Int;
	public var originalHeight:Int;
	public var format:PixelFormat;
  
	private function new() {}

  public function get(x:Int, y:Int):Color{
    throw "Abstract method call";
  }
  public function set(x:Int, y:Int, c:Color):Void{
    throw "Abstract method call";
  }

	public function load(input:Input, ?f:PixelFormat):Void{
    throw "Abstract method call";
  }

  public function save(format:PixelFormat):Output{
    throw "Abstract method call";
  }
}

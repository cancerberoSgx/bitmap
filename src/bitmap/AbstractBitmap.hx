package bitmap;
import haxe.io.Input;
import bitmap.Bitmap;
import haxe.io.Output;
import haxe.io.Bytes;

@:abstract class AbstractBitmap implements Bitmap {
	@:readOnly public var data:Bytes;
	@:readOnly public var width:Int;
	@:readOnly public var height:Int;
  @:readOnly public var originalWidth:Int;
	@:readOnly public var originalHeight:Int;
	@:readOnly public var format:PixelFormat;
  
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

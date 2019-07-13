package bitmap;

class IOUtil {
  public static function fromFile(path:String):haxe.io.Input  {
    #if js
    untyped var s = require("fs").readFileSync(path);
    var bytes = haxe.io.Bytes.ofData(s);
    return new haxe.io.BytesInput(bytes);
    #else
    return sys.io.File.read("test/assets/n.png", true);   
    #end
    throw "Unexpected end of method";
  }
}
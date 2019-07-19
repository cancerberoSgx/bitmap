package;

import examples.Example;
import examples.Shapes;
import bitmap.*;
import js.Browser.*;
import js.*;
import app.State;
import app.App;
import Util;

class Main {

	public static function main() {
		Util.fetchResource('bluebells.png', (data:haxe.io.BytesData)->{
       	var bytes = haxe.io.Bytes.ofData(data);
		var input = new haxe.io.BytesInput(bytes);
		var bitmap = new PNGBitmap();
		bitmap.load(input);
		new App(bitmap, initialState());
     });
	}
  
  public static function initialState():State {
    return {
      example: new Shapes()
    };
  }
  
}

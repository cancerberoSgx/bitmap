package;

import bitmap.*;
import js.Browser.*;
import js.*;
import app.State;
import app.App;

class Main {

	static function loaded(data:haxe.io.BytesData) {
		var bytes = haxe.io.Bytes.ofData(data);
		var input = new haxe.io.BytesInput(bytes);
		var bitmap = new PNGBitmap();
		bitmap.load(input);

		new App(bitmap, new State());
	}
  
	public static function main() {
		untyped applicationFetchImage('bluebells.png', loaded);
	}
  
}

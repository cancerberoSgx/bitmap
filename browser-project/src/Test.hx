import bitmap.*;
import bitmap.Types.Blend;
import js.Browser.*;
import js.*;
import js.html.*;

class Test {

	var rectangleButton:js.html.ButtonElement;
	var input:js.html.ImageElement;
	var output:js.html.ImageElement;
	var bitmap:Bitmap;

	function new(b:Bitmap) {
		bitmap = b;
	}

	public static function main() {
		untyped applicationFetchImage('bluebells.png', loaded);
	}

	static function loaded(data:haxe.io.BytesData) {
		var bytes = haxe.io.Bytes.ofData(data);
		var input = new haxe.io.BytesInput(bytes);
		var bitmap = new PNGBitmap();
		bitmap.load(input);
		new Test(bitmap).start();
	}

	function start() {
		rectangleButton = cast document.querySelector('.rectangleButton');
		input = cast document.querySelector('.input');
		output = cast document.querySelector('.output');
		rectangleButton.addEventListener('click', rectangleButtonClicked);
		input.src = bitmap.io.toDataUrl();
	}

	function rectangleButtonClicked() {
		bitmap.draw.rectangle2(20, 40, 100, 50, Color.create(221, 111, 111, 66), true, {type: Blend.mean});
		bitmap.draw.triangle(220, 30, 300, 150, 90, 210, Color.create(21, 211, 111, 66), true, {type: Blend.mean});
		output.src = bitmap.io.toDataUrl();
	}
}

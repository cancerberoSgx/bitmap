
import bitmap.*;
import js.Browser.*;
import js.*;
import js.html.*;
class Test {
  function new(){}
	public static function main() {
    untyped debugger;
		untyped applicationFetchImage('bluebells.png', loaded);
	}
	static function loaded(data:haxe.io.BytesData) {
    untyped debugger;
		var bytes = haxe.io.Bytes.ofData(data);
		var input = new haxe.io.BytesInput(bytes);
		var bitmap = new PNGBitmap();
		bitmap.load(input);
    new Test().start(bitmap);
	}

var rectangleButton:js.html.ButtonElement;
var input:js.html.ImageElement;
var output:js.html.ImageElement;

function start(bitmap:Bitmap){
  rectangleButton=cast document.querySelector('.rectangleButton');
  input=cast document.querySelector('.input');
  output=cast document.querySelector('.output');
  rectangleButton.addEventListener('click', rectangleButtonClicked);

  // var o = new BytesOutput()
  // output.src =  'data:image/png;'window.btoa(bitmap.data.b);
  // var gg = bitmap.data.getData();

  // var canvas:CanvasElement = document.createCanvasElement();
  // document.body.appendChild(canvas);
	// 	canvas.width = bitmap.width;
	// 	canvas.height = bitmap.height;
	// 	var context = canvas.getContext2d();
  // // canvas.
  // untyped  var imageData = new ImageData(cast new Uint8ClampedArray(cast bitmap.data.b.buffer.bytes), bitmap.width, bitmap.height);
  //   context.putImageData(imageData, bitmap.width, bitmap.height);
  //   untyped debugger;

  // // var b:String = 'data:image/png;'window.btoa(bitmap.data.b);
}

function rectangleButtonClicked(){
  window.alert('click');
}
	// public static function fetchImage(url:String, cb:(data:Dynamic) -> Void) {
	// 	untyped (async() => {	var response = await fetch(url);	var arrayBuffer = await	response.arrayBuffer();	cb(arrayBuffer); })();
	// }
}

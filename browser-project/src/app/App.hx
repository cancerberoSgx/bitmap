package app;

import bitmap.*;
import js.Browser.*;
import js.*;
import js.html.*;
import examples.*;
import state.*;

class App {

	var input:js.html.ImageElement;
	var outputs:Array<js.html.ImageElement>;
	var bitmap:Bitmap;
var state:State;

	public function new(b:Bitmap, s:State) {
		bitmap = b;
    state=s;
    start();
	}

	function start() {
  document.querySelector('.shapes').addEventListener('click', function()return exampleSelected('shapes'));
  document.querySelector('.convolutions').addEventListener('click', function()return exampleSelected('convolutions'));
  document.querySelector('.affine').addEventListener('click', function()return exampleSelected('affine'));
  document.querySelector('.pixelize').addEventListener('click', function()return exampleSelected('pixelize'));
 		input = cast document.querySelector('.input');
		outputs = [cast document.querySelector('.output1'), cast document.querySelector('.output2'), cast document.querySelector('.output3'), cast document.querySelector('.output4'), cast document.querySelector('.output5')];
		input.src = bitmap.io.toDataUrl();
	}

	function exampleSelected(name) {
    
    if(name=='convolutions'){
 new Convolutions().run(bitmap, outputs);
    }
    else if(name=='shapes'){
  new Shapes().run(bitmap, outputs);
    }
      else if(name=='pixelize'){
  new Pixelize().run(bitmap, outputs);
    }
    else if(name=='affine'){
 new AffineTransformation().run(bitmap, outputs);
    }
    else {
  
    }
		// bitmap.draw.rectangle2(20, 40, 100, 50, Color.create(221, 111, 111, 66), true, {type: Blend.mean});
		// bitmap.draw.triangle(220, 30, 300, 150, 90, 210, Color.create(21, 211, 111, 66), true, {type: Blend.mean});
		// output.src = bitmap.io.toDataUrl();
	}

}

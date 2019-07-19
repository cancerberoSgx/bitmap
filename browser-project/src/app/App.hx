package app;

import bitmap.*;
import js.Browser.*;
import examples.*;

class App {
	var input:js.html.ImageElement;
	var outputs:Array<js.html.ImageElement>;
	var bitmap:Bitmap;
	var state:State;

	public function new(b:Bitmap, s:State) {
		bitmap = b;
		state = s;
		start();
	}

	function start() {
		document.querySelector('.shapes').addEventListener('click', function() return exampleSelected('shapes'));
		document.querySelector('.convolutions').addEventListener('click', function() return exampleSelected('convolutions'));
		document.querySelector('.affine').addEventListener('click', function() return exampleSelected('affine'));
		document.querySelector('.pixelize').addEventListener('click', function() return exampleSelected('pixelize'));
		document.querySelector('.colors').addEventListener('click', function() return exampleSelected('colors'));
		document.querySelector('.text').addEventListener('click', function() return exampleSelected('text'));
		document.querySelector('.getSource').addEventListener('click', function() getSource());

		input = cast document.querySelector('.input');
		outputs = [
			cast document.querySelector('.output1'),
			cast document.querySelector('.output2'),
			cast document.querySelector('.output3'),
			cast document.querySelector('.output4'),
			cast document.querySelector('.output5')
		];
		input.src = bitmap.io.toDataUrl();
		untyped outputs.forEach((o, i) -> o.addEventListener('click', e -> applicationDownload(e.currentTarget.src, 'output-' + i + '.png')));
	}

	function getSource() {
		alert(state.example.getSource());
	}

	function exampleSelected(name) {
		var ex:Example;
		if (name == 'convolutions') {
			ex = new Convolutions();
		} else if (name == 'shapes') {
			ex = new Shapes();
		} else if (name == 'pixelize') {
			ex = new Pixelize();
		} else if (name == 'colors') {
			ex = new Colors();
		} else if (name == 'affine') {
			ex = new AffineTransformation();
		}else if (name == 'text') {
			ex = new Text();
		} else {
			throw "example not recognized";
		}
		if (ex != null) {
			state.example = ex;
			ex.run({bitmap:bitmap, outputs:outputs});
		}
	}
}

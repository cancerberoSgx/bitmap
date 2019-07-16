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
		state = s;
		start();
	}

	function start() {
		document.querySelector('.shapes').addEventListener('click', function() return exampleSelected('shapes'));
		document.querySelector('.convolutions').addEventListener('click', function() return exampleSelected('convolutions'));
		document.querySelector('.affine').addEventListener('click', function() return exampleSelected('affine'));
		document.querySelector('.pixelize').addEventListener('click', function() return exampleSelected('pixelize'));
		document.querySelector('.colors').addEventListener('click', function() return exampleSelected('colors'));
		input = cast document.querySelector('.input');
		outputs = [
			cast document.querySelector('.output1'),
			cast document.querySelector('.output2'),
			cast document.querySelector('.output3'),
			cast document.querySelector('.output4'),
			cast document.querySelector('.output5')
		];
		input.src = bitmap.io.toDataUrl();
    untyped outputs.forEach((o, i)->o.addEventListener('click', e-> applicationDownload(e.currentTarget.src, 'output-'+i+'.png')));
	}

	function exampleSelected(name) {
		if (name == 'convolutions') {
			new Convolutions().run(bitmap, outputs);
		} else if (name == 'shapes') {
			new Shapes().run(bitmap, outputs);
		} else if (name == 'pixelize') {
			new Pixelize().run(bitmap, outputs);
		} else if (name == 'colors') {
			new Colors().run(bitmap, outputs);
		} else if (name == 'affine') {
			new AffineTransformation().run(bitmap, outputs);
		} else {}
	}
}

package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Convolution;
import js.html.ImageElement;

class Convolutions implements Example {
	public function new() {}

	public function run(bitmap:Bitmap, outputs:Array<js.html.ImageElement>) {
    // shortcut to blur convolution
		var result0 = bitmap.transform.convolve(Convolution.blur(7));
		outputs[0].src = result0.io.toDataUrl();

		var result1 = bitmap.transform.convolve(Convolution.sharp(0.7, 0.1));
		outputs[1].src = result1.io.toDataUrl();
    
    // defining the kernel manually
		var edgy = [[0.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 0.0]];
		var result3 = bitmap.transform.convolve({
			kernel: edgy,
			bias: 0.2,
			factor: 1.1,
		});
		outputs[3].src = result3.io.toDataUrl();
	}
}

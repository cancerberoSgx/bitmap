package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Convolution;
import js.html.ImageElement;

class Convolutions implements Example {
	public function new() {}
  public var name='convolutions';
	public function run(o: ExampleOptions):Void {
    // shortcut to blur convolution
		var result0 = o.bitmap.transform.convolve(Convolution.blur(7));
		// o.outputs[0].src = result0.io.toDataUrl();

		var result1 = o.bitmap.transform.convolve(Convolution.sharp(0.7, 0.1));
		// o.outputs[1].src = result1.io.toDataUrl();
    
    // defining the kernel manually
		var edgy = [[0.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 0.0]];
		var result3 = o.bitmap.transform.convolve({
			kernel: edgy,
			bias: 0.2,
			factor: 1.1,
		});
		// o.outputs[3].src = result3.io.toDataUrl();
    o.done({output:[result0, result1, result3]});
	}
     public function getSource() {
     return  haxe.Resource.getString("Convolutions");
   }
}

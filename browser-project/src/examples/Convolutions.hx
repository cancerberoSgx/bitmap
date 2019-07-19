package examples;

import examples.AbstractExample;
import bitmap.transformation.Convolution;
import examples.Example.ExampleOptions;

class Convolutions extends AbstractExample {
	override function getName() {
		return 'Convolutions';
	}

	override public function run(o:ExampleOptions):Void {
		// shortcut to blur convolution
		var result0 = o.bitmap.transform.convolve(Convolution.blur(7));

		var result1 = o.bitmap.transform.convolve(Convolution.sharp(0.7, 0.1));

		// defining the kernel manually
		var edgy = [[0.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 0.0]];
		var result3 = o.bitmap.transform.convolve({
			kernel: edgy,
			bias: 0.2,
			factor: 1.1,
		});

		o.done({output: [result0, result1, result3]});
	}
}

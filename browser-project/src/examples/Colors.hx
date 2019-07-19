package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Convolution;
import js.html.ImageElement;

class Colors implements Example {
	public function new() {}
  public var name='colors';

	public function run(o:ExampleOptions) {
		var result0 = o.bitmap.color.filter({
			alpha: {a: 0.2, c: 0}
		});
		// o.outputs[0].src = result0.io.toDataUrl();

		var result1 = o.bitmap.color.filter({
			red: {a: 1.5, c: 2},
			green: {a: 1.0, c: -15},
			alpha: {a: 0.6, c: 0}
		});
		// o.outputs[1].src = result1.io.toDataUrl();
    o.done({output:[result0, result1 ]});

	}

	public function getSource() {
		return haxe.Resource.getString("Colors");
	}
}

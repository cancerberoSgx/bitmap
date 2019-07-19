package examples;

import examples.Example;
import bitmap.*;
import bitmap.Types.Background;
import bitmap.transformation.Affine;
import js.html.ImageElement;

class AffineTransformation implements Example {
	public function new() {}

	public function run(o:ExampleOptions) {
		// just scale, but we want to set the bg property on the bitmap first so padding is transparent
		o.bitmap.bg = Color.create(255, 0, 0, 222);
		var result1 = o.bitmap.transform.affine({
			affine: new Affine().scale(0.7, 0.6),
			bg: Background.bg
		});
		o.outputs[1].src = result1.bitmap.io.toDataUrl();

		// compose transformations using the matrix
		var result2 = o.bitmap.transform.affine({
			affine: new Affine().scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6),
		});
		o.outputs[2].src = result2.bitmap.io.toDataUrl();

		// manually define the affine transformation matrix
		var result3 = o.bitmap.transform.affine({
			matrix: {
				a: 0.4,
				b: 0.5,
				c: 0.2,
				d: 1.5,
				e: 2.0,
				f: 3.0
			}
		});
		o.outputs[3].src = result3.bitmap.io.toDataUrl();
	}

	public function getSource() {
		return haxe.Resource.getString("AffineTransformation");
	}
}

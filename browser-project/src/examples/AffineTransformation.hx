package examples;

import examples.Example.ExampleOptions;
import bitmap.*;
import bitmap.Types.Background;
import bitmap.transformation.Affine;

class AffineTransformation extends AbstractExample {
	override function getName() {
		return 'AffineTransformation';
	}

	override public function run(o:ExampleOptions) {
		// just scale, but we want to set the bg property on the bitmap first so padding is transparent
		o.bitmap.bg = Color.create(255, 0, 0, 222);
		var result1 = o.bitmap.transform.affine({
			affine: new Affine().scale(0.7, 0.6),
			bg: Background.bg
		});

		// compose transformations using the matrix
		var result2 = o.bitmap.transform.affine({
			affine: new Affine().scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6),
		});

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

		o.done({output: [result1.bitmap, result2.bitmap, result3.bitmap]});
	}
}

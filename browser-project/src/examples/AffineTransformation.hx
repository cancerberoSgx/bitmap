package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Affine;
import js.html.ImageElement;

class AffineTransformation implements Example {
	public function new() {}

	public function run(bitmap:Bitmap, outputs:Array<js.html.ImageElement>) {

    // compose transformations using the matrix
    var result2 = bitmap.transform.affine({
			affine: new Affine().scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6),
		});
		outputs[2].src = result2.bitmap.io.toDataUrl();


    // manually define the affine transformation matrix
	var result3 = bitmap.transform.affine({
			matrix: {
				a: 0.4,
				b: 0.5,
				c: 0.2,
				d: 1.5,
				e: 2.0,
				f: 3.0
			}
		});
		outputs[3].src = result3.bitmap.io.toDataUrl();
	}
}

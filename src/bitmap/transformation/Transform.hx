package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

typedef TransformationOptions = {
	@:optional var region:Types.Rectangle;
	@:optional public var bitmap:Bitmap;
	@:optional public var output:Bitmap;
}

class Transform {
	private var bitmap:Bitmap;

	public function new(b:Bitmap) {
		bitmap = b;
	}

	public function pixelize(t:Pixelize.PixelizeOptions) {
		t.bitmap = bitmap;
		var b = new Pixelize().transform(t);
		return b;
	}

	public function convolve(t:Convolution.ConvolveOptions) {
		t.bitmap = bitmap;
		var b = Convolution.convolve(t);
		return b;
	}

	public function affine(t:Affine.AffineOptions) {
		Sure.sure(t.matrix != null || t.affine != null);
		t.bitmap = bitmap;
		var affine:Affine;
		if (t.affine == null) {
			affine = new Affine();
			affine.assign(t.matrix);
		} else {
			affine = t.affine;
		}
		var result = affine.transform(t);
		return result;
	}
}

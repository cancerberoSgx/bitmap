package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

typedef TransformationOptions = {
	@:optional public var modify:Bool;
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
		return new Pixelize().transform(t);
	}

	public function convolve(t:Convolution.ConvolveOptions) {
		t.bitmap = bitmap;
		return Convolution.convolve(t);
	}

	public function affine(t: Affine.AffineOptions) {
    Sure.sure(t.matrix!=null||t.affine!=null);
		t.bitmap = bitmap;
    var affine:Affine;
    if(t.affine==null){
      affine = new Affine();
      affine.assign(t.matrix);
    }else {
      affine = t.affine;
    }
		return affine.transform(t);
	}

}

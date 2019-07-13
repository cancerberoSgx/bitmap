package bitmap.transformation;

import bitmap.*;
import bitmap.transformation.*;

class Transform {
  private var bitmap:Bitmap;

	public function new(b:Bitmap) {
		bitmap = b;
	}

public function pixelize(t:Pixelize.PixelizeOptions) {
  t.bitmap = bitmap;
  return new Pixelize().transform(t);
}
}

typedef TransformationOptions = {
  @:optional var modify:Bool;
  @:optional var bitmap:Bitmap;
}

// typedef TransformationResult = {
//   var bitmap:Bitmap;
// }
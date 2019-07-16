package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Convolution;
import js.html.ImageElement;

class Pixelize implements Example {
	public function new() {}

	public function run(bitmap:Bitmap, outputs:Array<js.html.ImageElement>) {
		var result0 = bitmap.transform.pixelize({width: 100, height: 90});
		outputs[0].src = result0.io.toDataUrl();
		outputs[1].src = bitmap.transform.pixelize({width: 70, height: 60}).io.toDataUrl();
		outputs[2].src = bitmap.transform.pixelize({width: 40, height: 34}).io.toDataUrl();
		outputs[3].src = bitmap.transform.pixelize({width: 28, height: 25}).io.toDataUrl();
		outputs[4].src = bitmap.transform.pixelize({width: 19, height: 15}).io.toDataUrl();
	}
   public function getSource() {
     return  haxe.Resource.getString("Pixelize");
   }
}

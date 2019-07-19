package examples;

import examples.Example;
import bitmap.Bitmap;
import bitmap.transformation.Convolution;
import js.html.ImageElement;

class Pixelize implements Example {
	public function new() {}
  public var name='pixelize';
	public function run(o:ExampleOptions) {
		// var result0 = o.bitmap.transform.pixelize({width: 100, height: 90});
		// o.outputs[0].src = result0.io.toDataUrl();
		// o.outputs[1].src = o.bitmap.transform.pixelize({width: 70, height: 60}).io.toDataUrl();
		// o.outputs[2].src = o.bitmap.transform.pixelize({width: 40, height: 34}).io.toDataUrl();
		// o.outputs[3].src = o.bitmap.transform.pixelize({width: 28, height: 25}).io.toDataUrl();
		// o.outputs[4].src = o.bitmap.transform.pixelize({width: 19, height: 15}).io.toDataUrl();
    o.done({output:[ o.bitmap.transform.pixelize({width: 100, height: 90}), o.bitmap.transform.pixelize({width: 70, height: 60}),o.bitmap.transform.pixelize({width: 40, height: 34}),  o.bitmap.transform.pixelize({width: 28, height: 25}) ,  o.bitmap.transform.pixelize({width: 19, height: 15})]});
    
	}
   public function getSource() {
     return  haxe.Resource.getString("Pixelize");
   }
}

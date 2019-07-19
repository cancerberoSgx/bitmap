package examples;
import examples.Example;

import bitmap.Types.Blend;
import bitmap.*;
import js.html.*;

class Shapes implements Example {
  public var name='shapes';
  public function new(){}
  public function run(o: ExampleOptions){
    var output = o.bitmap.clone();
    output.draw.rectangle2(20, 40, 100, 50, Color.create(221, 111, 111, 66), true, {type: Blend.mean});
		output.draw.triangle(220, 30, 300, 150, 90, 210, Color.create(21, 211, 111, 66), true, {type: Blend.mean});
		output.draw.line(12 , 211, 88, 1, Color.create(21, 21, 211, 166));
		// o.outputs[0].src = o.bitmap.io.toDataUrl();
    o.done({output:[output]});
    

   }
   public function getSource() {
     return  haxe.Resource.getString("Shapes");
   }
}
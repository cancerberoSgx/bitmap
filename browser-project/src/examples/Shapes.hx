package examples;
import examples.Example;

import bitmap.Types.Blend;
import bitmap.*;
import js.html.*;

class Shapes implements Example {
  public function new(){}
  public function run(bitmap : Bitmap, outputs:Array<js.html.ImageElement>){
    bitmap.draw.rectangle2(20, 40, 100, 50, Color.create(221, 111, 111, 66), true, {type: Blend.mean});
		bitmap.draw.triangle(220, 30, 300, 150, 90, 210, Color.create(21, 211, 111, 66), true, {type: Blend.mean});
		bitmap.draw.line(12 , 211, 88, 1, Color.create(21, 21, 211, 166));
		outputs[0].src = bitmap.io.toDataUrl();
    // return bitmap;
   }
}
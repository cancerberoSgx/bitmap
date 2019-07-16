
package examples;

import examples.*;
import bitmap.*;
import js.html.*;

interface Example {
  public function run(bitmap : Bitmap, outputs:Array<js.html.ImageElement>):Void;
    public function getSource():String;
}

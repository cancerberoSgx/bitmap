
package examples;

import examples.*;
import bitmap.*;
import js.html.*;

interface Example {
  public function run(options:ExampleOptions):Void;
    public function getSource():String;
}
typedef ExampleOptions = {
  bitmap : Bitmap, 
  outputs: Array<js.html.ImageElement>
}
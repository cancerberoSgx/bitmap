
package examples;

import bitmap.*;

interface Example {
  public function run(options:ExampleOptions):Void;
  public function getSource():String;
 public function getName():String;
}

typedef ExampleOptions = {
  var bitmap : Bitmap;
  function done(o:ExampleResult):Void;
};

typedef ExampleResult = {
  var output: Array<Bitmap>;
};
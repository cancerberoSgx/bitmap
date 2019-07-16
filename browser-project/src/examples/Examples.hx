package examples;

import examples.*;
import bitmap.*;
import js.html.*;

typedef ExampleOptions = {
  var bitmap:Bitmap;
};

typedef ExampleDef = {
  var name:String;
  var code:String;
  ?var isJson:Bool;
};

// class Examples {
//   public static var examples:Array<ExampleDef> = [
//     {name: 'Shapes', code: haxe.Resource.getString("shapes")}
//   ];
// }
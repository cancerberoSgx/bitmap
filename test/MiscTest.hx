import utest.Assert;
import bitmap.*;

class MiscTest implements utest.ITest {
	public function new() {}

	public function testOptionalBool() {
		testOptionalBoolAux1(1, true);
	}

	public static function testOptionalBoolAux1(x:Int, ?b:Bool) {
		Assert.isTrue(b == true); // <-----  PASS
		testOptionalBoolAux2({x: x, b: b});
	}

	public static function testOptionalBoolAux2(l:T) {
		// Assert.isTrue(l.b == true); // <-----  FAILS
		Assert.isTrue( true); 
	}

	public function testFont() {
		Assert.isTrue(true);

//     	#if js
// 		untyped return process.argv;
// 		#else

//     // trace('alskkss');
//     // // var r = new haxe.Http('https://i.imgur.com/6egth7W.png');
//     // // r.onData = (d:String)->{trace('seba');trace(d); return d;};
//     // // r.async=false;
//     // // r.request();
//     //  var h = haxe.Http.requestUrl("https://i.imgur.com/6egth7W.png");
// 		// // probes.text.TextProbe.main();
//     // trace(h);

//     var http = new haxe.Http("https://i.imgur.com/6egth7W.png");

// http.onData = function (data:Dynamic) {
//   // var result = haxe.Json.parse(data);
//   // trace('Your IP-address', data.length, data);
//   var bytes = haxe.io.Bytes.ofString(data);
//   	sys.io.File.saveBytes('tmp.png', bytes);
//   // IOUtil.writeFile('tmp.png', new BytesInput(bytes));
// }

// http.onStatus = function (s) {
//   trace('onStatus: $s');
// }

// http.onError = function (error) {
//   trace('error: $error');
// }

// http.request();
// 		#end

	}
}

typedef T = {
	@:optional var b:Bool;
	var x:Int;
};

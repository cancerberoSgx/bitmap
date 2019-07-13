import utest.Assert;

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
	}
}

typedef T = {
	@:optional var b:Bool;
	var x:Int;
};

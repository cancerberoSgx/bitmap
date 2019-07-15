import utest.Assert;
import bitmap.*;

using bitmap.support.StructureTools;

// UTEST_PATTERN
// export UTEST_PATTERN=testLotsGetSet; time haxe test/targets/test-node.hxml
// export UTEST_PATTERN=testLotsGetSet; time node bin/test/Main.js
class PerformanceGetSetTest implements utest.ITest {
	public function new() {}

	public function testLotsGetSet() {
		var N = 444, M = 1010, noRangeCheck = false, int32Mode = false;
		var b1 = PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"));
		b1.noRangeCheck = noRangeCheck;
		b1.int32Mode = int32Mode;
		var b2 = b1.clone();
		b2.int32Mode = int32Mode;
		b2.noRangeCheck = noRangeCheck;

		for (i in 0...N) {
			var av1 = ColorUtil.average(b1); // read
			var av2 = ColorUtil.average(b2); // read
			randomRects(b1, M); // write
			randomRects(b2, M); // write
		}
		Assert.stringContains("Input", "Input");
	}

	static function randomRects(b:Bitmap, N = 100) {
		for (i in 0...N) {
			b.draw.rectangle(Util.randomRectangle({
					x: 0,
					y: 0,
					width: b.width,
					height: b.height
				}).combine({c: ColorUtil.random()}));
		}
	}
}

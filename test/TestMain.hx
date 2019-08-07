package;

import utest.Runner;
import utest.ui.Report;
import PNGBitmapTest;
import IOUtilTest;
import BitmapUtilTest;
import MiscTest;
import TransformTest;
import PerformanceGetSetTest;
import GeometrizeTest;
import DrawTest;
import ColorsTest;
import FontTest;
import BitmapIOTest;

class TestMain {
	static function main() {
		var runner = new Runner();
		runner.addCase(new PNGBitmapTest());
		runner.addCase(new IOUtilTest());
		runner.addCase(new BitmapUtilTest());
		runner.addCase(new MiscTest());
		runner.addCase(new TransformTest());
		runner.addCase(new DrawTest());
		runner.addCase(new ColorsTest());
		runner.addCase(new FontTest());
		runner.addCase(new BitmapIOTest());
		Report.create(runner);
		runner.run();
	}
}

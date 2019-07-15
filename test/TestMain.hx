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
class TestMain {
	static function main() {		
		var runner = new Runner();
		runner.addCase(new PNGBitmapTest());
		runner.addCase(new IOUtilTest());
		runner.addCase(new BitmapUtilTest());
		runner.addCase(new MiscTest());
		runner.addCase(new TransformTest());
		runner.addCase(new GeometrizeTest());
		runner.addCase(new DrawTest());
		// runner.addCase(new PerformanceGetSetTest());
    
		Report.create(runner);
		runner.run();
	}
}

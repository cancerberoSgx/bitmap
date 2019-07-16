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

class TestMain {
	static function main() {
    trace('Starting');
	// try {

  	var runner = new Runner();
		runner.addCase(new PNGBitmapTest());
		runner.addCase(new IOUtilTest());
		runner.addCase(new BitmapUtilTest());
		runner.addCase(new MiscTest());
		runner.addCase(new TransformTest());
		runner.addCase(new DrawTest());
		runner.addCase(new ColorsTest());
		runner.addCase(new FontTest());

		Report.create(runner);
		runner.run();
    trace('Finishing');

		// runner.addCase(new PerformanceGetSetTest());
		// runner.addCase(new GeometrizeTest());
  // }catch(ex:Dynamic){
  //   trace("error", ex);
  // }
	}
}

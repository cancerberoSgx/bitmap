package;

import utest.Runner;
import utest.ui.Report;
import PNGBitmapTest;
import IOUtilTest;

class TestMain {
	static function main() {		
		var runner = new Runner();
		runner.addCase(new PNGBitmapTest());
		runner.addCase(new IOUtilTest());
		Report.create(runner);
		runner.run();
	}
}

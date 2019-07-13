package;

import utest.Runner;
import utest.ui.Report;
import RGBABitmapTest;
import IOUtilTest;

class TestMain {
	static function main() {		
		var runner = new Runner();
		runner.addCase(new RGBABitmapTest());
		runner.addCase(new IOUtilTest());
		Report.create(runner);
		runner.run();
	}
}

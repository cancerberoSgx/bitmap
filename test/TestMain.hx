package;

import utest.Runner;
import utest.ui.Report;
import RGBABitmapTest;
import FileUtilTest;

class TestMain {
	static function main() {		
		var runner = new Runner();
		runner.addCase(new RGBABitmapTest());
		runner.addCase(new FileUtilTest());
		Report.create(runner);
		runner.run();
	}
}

package;

import utest.Runner;
import utest.ui.Report;
import PNGBitmapTest;
import IOUtilTest;
import BitmapUtilTest;
import MiscTest;

class TestMain {
	static function main() {		
		var runner = new Runner();
		runner.addCase(new PNGBitmapTest());
		runner.addCase(new IOUtilTest());
		runner.addCase(new BitmapUtilTest());
		runner.addCase(new MiscTest());
		Report.create(runner);
		runner.run();
	}

  	static function fff(a:Int,b:Int):Int{return 1;} 
}

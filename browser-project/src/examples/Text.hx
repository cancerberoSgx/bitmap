package examples;

import examples.Example;
import bitmap.*;
import bitmap.text.*;

class Text extends AbstractExample {
	override public function getName() {
		return 'Text';
	}

	override public function run(o:ExampleOptions) {
		var manager = FontManager.getInstance();
		IOUtil.fetch("openSans.png", (error, dataPng) -> {
			IOUtil.fetch("openSans.xml", (error, dataXml) -> {
				var font = manager.registerFont({
					img: dataPng,
					fmt: dataXml,
					fontFamily: 'openSans'
				});
				var r = manager.render({
					text: 'hello world',
					fontFamily: 'openSans',
					x: 10,
					y: 20,
					bitmap: o.bitmap
				});
				o.done({output: [r.bitmap]});
			});
		});
	}
}

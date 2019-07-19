package examples;

import examples.Example;
import bitmap.*;
import bitmap.text.*;

class Text implements Example {
	public function new() {}
  public var name='text';

	public function run(o:ExampleOptions) {
		var manager = FontManager.getInstance();
		trace('before');

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
				// o.outputs[0].src = r.bitmap.io.toDataUrl();
			});
		});
	}

	public function getSource() {
		return haxe.Resource.getString("Text");
	}
}

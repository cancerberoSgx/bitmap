package;

import examples.Shapes;
import bitmap.*;
import js.Browser.*;
import app.*;

class Main {
	public static function main() {
		IOUtil.fetchResource('bluebells.png', (error:Dynamic, data:haxe.io.BytesData) -> {
			var bytes = haxe.io.Bytes.ofData(data);
			var input = new haxe.io.BytesInput(bytes);
			var bitmap = new PNGBitmap();
			bitmap.load(input);
			var initialState:State = {
				example: new Shapes(),
				bitmap: bitmap,
				output: [for (o in 0...5) bitmap.clone()]
			};
			Store.init(initialState);
			Store.getInstance().addStateChangeListener({
				onStateChange: (old:State, newState:State) -> {
					Component.renderDom(document.querySelector('#main'), new Layout({state: newState}));
				}
			});
			Store.getInstance().setState(initialState);
		});
	}
}

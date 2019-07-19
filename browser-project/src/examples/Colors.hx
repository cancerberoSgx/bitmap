package examples;

import examples.Example.ExampleOptions;
import examples.AbstractExample;

class Colors extends AbstractExample {
	override function getName() {
		return 'Colors';
	}

	override public function run(o:ExampleOptions) {
		var result0 = o.bitmap.color.filter({
			alpha: {a: 0.2, c: 0}
		});

		var result1 = o.bitmap.color.filter({
			red: {a: 1.5, c: 2},
			green: {a: 1.0, c: -15},
			alpha: {a: 0.6, c: 0}
		});

		o.done({output: [result0, result1]});
	}
}

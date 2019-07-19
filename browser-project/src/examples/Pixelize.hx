package examples;

import examples.Example;

class Pixelize extends AbstractExample {
	override public function getName() {
		return 'Pixelize';
	}

	override public function run(o:ExampleOptions) {
		o.done({
			output: [
				o.bitmap.transform.pixelize({width: 100, height: 90}),
				o.bitmap.transform.pixelize({width: 70, height: 60}),
				o.bitmap.transform.pixelize({width: 40, height: 34}),
				o.bitmap.transform.pixelize({width: 28, height: 25}),
				o.bitmap.transform.pixelize({width: 19, height: 15})
			]
		});
	}
}

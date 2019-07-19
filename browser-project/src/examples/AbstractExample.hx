package examples;

import examples.Example;
import examples.Example.ExampleOptions;

@:abstract class AbstractExample implements Example {
	public function run(o:ExampleOptions) {
		throw "Abstract method";
	}

	public function getSource() {
		return haxe.Resource.getString(getName());
	}

	public function new() {}

	public function getName():String {
		throw "Abstract method";
	}
}

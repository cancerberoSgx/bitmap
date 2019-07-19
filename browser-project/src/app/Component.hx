package app;

import js.html.Element;

typedef Props = {
	var state(default, null):State;
	@:optional var children(default, null):Array<Component<Props>>;
};

class Component<P:Props> {
	var props(default, null):Props;
  var container(default, null):Element;
	public function new(p:P) {
		props = p;
	}

	@:abstract public function render():String {
		throw "Abstract method";
	}

	function afterRender():Void {}
 
	@:final private function _afterRender():Void {
		afterRender();
		if (this.props.children != null) {
			for(c in this.props.children) c._afterRender();
		}
	}

  function query(sel:String):Array<Element> {
    return [for(e in this.container.querySelectorAll(sel))(cast e)];
  }

  function queryOne (sel:String):Element {
    return   this.container.querySelector (sel) ;
  }
  
	public static function renderDom<P:Props>(el:Element, c:Component<P>) {
		var s = c.render();
    c.container = el;
		el.innerHTML = s;
		c._afterRender();
	}
}

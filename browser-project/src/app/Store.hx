package app;

using bitmap.support.StructureTools;

class Store<S:State> {
	private var state(null, null):State;

	private function new(s:S) {
		this.state = s;
	}

	public function getState():S {
		return cast state;
	}

	public function setState(partialState:State) {
		var old = state;
		state = {example: state.example}.combine(this.state, partialState);
		for (l in stateChangeListeners)
			l.onStateChange(old, state);
	}

	private var stateChangeListeners:Array<StateChangeListener> = [];

	public function addStateChangeListener(l:StateChangeListener) {
		stateChangeListeners.push(l);
	}

	private static var instance:Store<State>;

	public static function getInstance() {
		if (instance == null) {
			throw "must call init() before getInstance()";
		}
		return instance;
	}

	public static function init(state:State) {
		if (instance != null) {
			throw "instance already initialized";
		}
		instance = new Store<State>(state);
	}
}

typedef StateChangeListener = {
	function onStateChange(old:State, newState:State):Void;
}
// typedef Action ={
//   var type:String;
// }
// typedef SelectExampleAction = {
//   >Action,
//   var example:String;
// }
// interface ActionDispatcher<S:State> {
//   function handle(state:S, a:Action):Any
// }
// class SelectExampleDispatcher<S:State> implements ActionDispatcher<S> {
// 	// var example(default, null):String;
//   // public function new( ){
//   //   this.example = example;
//   // }
//   // var type='selectExample';
//   function handle(state:S, a:Action){
// if(a.type=='selectExample'){
// var ex:Example;
// 		if (a.example == 'convolutions') {
// 			ex = new Convolutions();
// 		} else if (a.example == 'shapes') {
// 			ex = new Shapes();
// 		} else if (a.example == 'pixelize') {
// 			ex = new Pixelize();
// 		} else if (a.example == 'colors') {
// 			ex = new Colors();
// 		} else if (a.example == 'affine') {
// 			ex = new AffineTransformation();
// 		} else if (a.example == 'text') {
// 			ex = new Text();
// 		} else {
// 			throw "example not recognized";
// 		}
// 		if (ex != null) {
// 			props.state.example = ex;
// 			ex.run({bitmap: this.props.state.bitmap, outputs: outputs});
// 			// queryOne('.exampleCode').innerHTML = props.state.example.getSource();
// 		}
//         }
//   }
// }

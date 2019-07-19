package app;

import js.html.ImageElement;
import examples.*;
import app.*;

class Layout extends Component<Component.Props> {

	override public function render() {
		return '
<h1>Bitmap playground</h1>
<p>Welcome to Bitmap library playground! An image should be shown below (loaded as Bitmap). Play with the controls to see it in action.</p>
<p>Click on output images to download them.</p>
<br />
<button class="getSource">See Example Sources</button>
<button class="shapes ${this.props.state.example.name == 'shapes' ? 'selected' : ''}">draw shapes</button>
<button class="convolutions ${this.props.state.example.name == 'convolutions' ? 'selected' : ''}">Convolutions</button>
<button class="affine ${this.props.state.example.name == 'affine' ? 'selected' : ''}">Affine transformations</button>
<button class="pixelize ${this.props.state.example.name == 'pixelize' ? 'selected' : ''}">Pixelize</button>
<button class="colors ${this.props.state.example.name == 'colors' ? 'selected' : ''}">Colors</button>
<button class="text ${this.props.state.example.name == 'text' ? 'selected' : ''}">Text</button>
<br />
<br />

<img class="input" src="${this.props.state.bitmap.io.toDataUrl()}"/>

${[for(output in this.props.state.output)'<img src="${output.io.toDataUrl()}" />'].join('\n')}

<br />
<h3>Example code</h3>
<textarea class="exampleCode">${this.props.state.example.getSource()}</textarea>

<style>
${Styles.css}
</style>
  ';
	}

	override function afterRender() {
		queryOne('.shapes').addEventListener('click', e -> exampleSelected('shapes'));
		queryOne('.convolutions').addEventListener('click', e -> exampleSelected('convolutions'));
		queryOne('.affine').addEventListener('click', e -> exampleSelected('affine'));
		queryOne('.pixelize').addEventListener('click', e -> exampleSelected('pixelize'));
		queryOne('.colors').addEventListener('click', e -> exampleSelected('colors'));
		queryOne('.text').addEventListener('click', e -> exampleSelected('text'));
		queryOne('.getSource').addEventListener('click', getSource);
		untyped outputs.forEach((o, i) -> o.addEventListener('click', e -> applicationDownload(e.currentTarget.src, 'output-' + i + '.png')));
	}

	function getSource() {
		(cast queryOne('.exampleCode')).scrollIntoViewIfNeeded();
	}

	function exampleSelected(name) {
		var ex:Example;
		if (name == 'convolutions') {
			ex = new Convolutions();
		} else if (name == 'shapes') {
			ex = new Shapes();
		} else if (name == 'pixelize') {
			ex = new Pixelize();
		} else if (name == 'colors') {
			ex = new Colors();
		} else if (name == 'affine') {
			ex = new AffineTransformation();
		} else if (name == 'text') {
			ex = new Text();
		} else {
			throw "example not recognized";
		}
		if (ex != null) {
			ex.run({bitmap: this.props.state.bitmap, done: result->{
        Store.getInstance().setState({
          example: ex, output: result.output, bitmap: this.props.state.bitmap
        });
      }});
		}
	}
}

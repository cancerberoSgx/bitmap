package app;

import js.html.ImageElement;
import examples.*;
import app.*;

class Layout extends Component<Component.Props> {

	override public function render() {
		return '
<h1>Bitmap playground</h1>
<p>Welcome to Bitmap library playground! An image should be shown below (loaded as Bitmap). Play with the controls to see it in action. Click on output images to download them.</p>
<br />
<label>Load File <input type="file"  class="loadFile"></label> <br />
<button class="getSource">See Example Sources</button>
<button class="shapes ${this.props.state.example.getName() == 'shapes' ? 'selected' : ''}">Shapes</button>
<button class="convolutions ${this.props.state.example.getName() == 'convolutions' ? 'selected' : ''}">Convolutions</button>
<button class="affine ${this.props.state.example.getName() == 'affine' ? 'selected' : ''}">Affine</button>
<button class="pixelize ${this.props.state.example.getName() == 'pixelize' ? 'selected' : ''}">Pixelize</button>
<button class="colors ${this.props.state.example.getName() == 'colors' ? 'selected' : ''}">Colors</button>
<button class="text ${this.props.state.example.getName() == 'text' ? 'selected' : ''}">Text</button>
<br />

<img class="input" src="${this.props.state.bitmap.io.toDataUrl()}"/>

${[for(output in this.props.state.output)'<img class="output" src="${output.io.toDataUrl()}" />'].join('\n')}

<br />
<h3>Example code</h3>
<textarea class="exampleCode">${this.props.state.example.getSource()}</textarea>

<style>
${Styles.css}
</style>

<script>
window.applicationDownload = async function (url, filename) {
  var response = await fetch(url)
  var blob = await response.blob()
  var a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.setAttribute("download", filename);
  a.click();
}
</script>
  ';
	}

	override function afterRender() {
		queryOne('.shapes').addEventListener('click', e -> exampleSelected('shapes'));
		queryOne('.convolutions').addEventListener('click', e -> exampleSelected('convolutions'));
		queryOne('.affine').addEventListener('click', e -> exampleSelected('affine'));
		queryOne('.pixelize').addEventListener('click', e -> exampleSelected('pixelize'));
		queryOne('.colors').addEventListener('click', e -> exampleSelected('colors'));
		queryOne('.text').addEventListener('click', e -> exampleSelected('text'));
		queryOne('.getSource').addEventListener('click', e->(cast queryOne('.exampleCode')).scrollIntoViewIfNeeded());
    var i = 0;
		for(output in query('.output')){
     untyped  output.addEventListener('click', e -> applicationDownload(e.currentTarget.src, 'output-' + i++ + '.png'));
    }    
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

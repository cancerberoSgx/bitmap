# Bitmap

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [API Reference](#api-reference)
- [Usage](#usage)
  * [Transformations](#transformations)
- [Browser example](#browser-example)
- [Command Line interface](#command-line-interface)
- [Scripts](#scripts)
  * [Run tests locally](#run-tests-locally)
  * [Run tests with docker](#run-tests-with-docker)
  * [Other](#other)
- [Status](#status)
- [Tests](#tests)
  * [Run locally](#run-locally)
  * [Run with docker](#run-with-docker)
- [TODO / Road map / Changelog](#todo--road-map--changelog)

<!-- tocstop -->

## Summary 

 * Easy to use API.
 * Supports all targets.
 * Although currently only PNG, the objective is to common formats (GIF, JPG).
 * Pixel access, RGBA color, blending
 * Shape drawing.
 * Composition, convolution, color blending and more.
 * Stay tunned!

**See the [Online Playground](https://cancerberosgx.github.io/bitmap/playground) to see what's this is all about!**

## Install

```sh
haxelib install bitmap
```

And don't forget to use `-lib bitmap` in your projects.

## API Reference

[API Reference](https://cancerberosgx.github.io/bitmap/index.html)

## Usage


The following example works on all targets but the browser since we are reading/writing files:

```haxe
import bitmap.*;
class Test {
  public static function test1() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("imgs/input.png"));	
    bitmap.set(30, 20, Color.create(23, 233, 111, 128)); 	
    bitmap.draw.rectangle({x: 10, y: 20, width: 40, height: 22, c: Color.create(12, 144, 0, 131), fill: false});
    var edges = [
      [0.0, -1.0, 0.0],
      [-1.0, 4.0, -1.0],
      [0.0, -1.0, 0.0]
    ];
		var edged = bitmap.transform.convolve({
       kernel: edges
    });

    IOUtil.writeBitmap('imgs/output.png', bitmap);
  }
}
```

### Transformations 

The purpose of the library is not only to provide easy image read/write but also basic transformations like resize, rotate, convolve, etc.

The following example shows how to apply an edge detection convolution matrix and apply the "pixelize" effect:


```haxe
import bitmap.*;
class Test {
  public static function test1() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("imgs/input.png"));	
    var edges = [
      [0.0, -1.0, 0.0],
      [-1.0, 4.0, -1.0],
      [0.0, -1.0, 0.0]
    ];
		var edged = bitmap.transform.convolve({
       kernel: edges
    });
    IOUtil.writeBitmap('imgs/edged.png', edged);
    var pixelized = bitmap.transform.pixelize({
			width: 50,
			height: 50,
			modify: true,
			alpha: 255
		});
    IOUtil.writeBitmap('imgs/pixelized.png', pixelized);

  }
}
```

## Browser example

[Playground demo](https://cancerberosgx.github.io/bitmap/playground)

(needs node.js)

```sh
cd browser-project
sh start.sh
```

This is a very simplistic example, that loads images using http requests (fetch() and arrayBuffer()) and then serializes bitmap back to PNG encoded as data urls (base64) and render in a HTMLImageElement. So it's not optimized for speed, just a proof of concept.

For a real playground, we should use web workers and canvas. Coming soon... However it's useful to test the API since it has several examples. 


## Command Line interface

`bitmap.cli` package contains a very simplistic command line application. Since operations like affine or convolutions have complex settings, most of the arguments must be given through a json file, example:

```sh
haxe scripts/cli.hxml
node bin/cli/main --input test/assets/bluebells.png --output tmp1.png --config test/assets/cliConfig1.json
```

where cliConfig1.json is something like the following, and as you can see it allows to declare series of transformations that will be applied to input images (arguments) in order:

```json
[
  {
    "transformation": "scale",
    "x": 0.5,
    "y": 0.5
  },
  {
    "transformation": "translate",
    "x": 122,
    "y": 33
  },
  {
    "transformation": "rotate",
    "degrees": 33,
    "precision": true
  },
  {
    "transformation": "pixelize",
    "width": 64,
    "height": 64
  }
]
```

## Native libraries for other targets (JavaScript)

Stay tunned for a native JavaScript library directly/ automatically ported from this project's source code. And maybe other languages too. I think that's the main advantage of haxe compared to other languages and I don't see this feature being much used. 

## Scripts

### Run tests locally

You will need java, php, g++, node.js to run all targets:

```sh
sh scripts/test.sh
```

### Run tests with docker

```sh
sh scripts/test-docker.sh
```

### Other

```sh
sh scripts/clean.sh
sh scripts/pack.sh
sh scripts/publish.sh
```

## Tests

### Run locally

You will need java, php, g++, node.js to run all targets:

```sh
sh scripts/test.sh
```

### Run with docker

```sh
sh test-docker.sh
```

## Status / TODO / Road map / Changelog

See [TODO.md](TODO.md)

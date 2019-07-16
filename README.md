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

[Playground demo](TODO)

(needs node.js)

```sh
cd browser-project
sh start.sh
```

This is a very simplistic example, that loads images using http requests (fetch() and arrayBuffer()) and then serializes bitmap back to PNG encoded as data urls (base64) and render in a HTMLImageElement. So it's not optimized for speed, just a proof of concept.

For a real playground, we should use web workers and canvas. (TODO).

However it's useful to test the API since it has several examples. 

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

## Status

 * `Bitmap` types to create from haxe.io.Input and get/set pixel colors
 * `IOUtil`: basic utilities to read/write Input / Ouput and files supporting all haxe targets.
 * `PNGBitmap`: Supports read/write PNG images pixel formats: ARGB, RGBA
 * tests running in all targets.

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

## TODO / Road map / Changelog

See [TODO.md](TODO.md)

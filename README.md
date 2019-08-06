# Bitmap

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [API Reference](#api-reference)
- [Usage](#usage)
- [Transformations](#transformations)
  * [Convolutions](#convolutions)
  * [Affine transformations](#affine-transformations)
  * [Color filters](#color-filters)
- [Browser example](#browser-example)
- [Command Line interface](#command-line-interface)
- [Native libraries for other targets (JavaScript)](#native-libraries-for-other-targets-javascript)
- [Scripts](#scripts)
  * [Run tests locally](#run-tests-locally)
  * [Run tests with docker](#run-tests-with-docker)
  * [Other](#other)
- [Tests](#tests)
  * [Run locally](#run-locally)
  * [Run with docker](#run-with-docker)
- [Status / TODO / Road map / Changelog](#status--todo--road-map--changelog)

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


The following example works on all targets but the browser since we are reading/writing files. It will draw a rectangle and then apply a blur filter:

```haxe
import bitmap.*;
import bitmap.transformation.Convolution;

var bitmap = PNGBitmap.create(IOUtil.readFile("imgs/input.png"));	
bitmap.draw.rectangle({x: 10, y: 20, width: 40, height: 22, c: Color.create(12, 144, 0, 131), fill: false});
bitmap.transform.convolve(Convolution.blur(7, 0.7));
BitmapIO.writeBitmap('imgs/output.png', bitmap);
```

The same example but in the browser, reading the bitmap from an HTMLInputElement and writing the result to a HTMLImageElement as data URL:

```haxe
import bitmap.*;
import bitmap.transformation.Convolution;

document.querySelector('input[type="file"]').addEventListener('change', e -> 
  BitmapIO.readHtmlInputFile(e.currentTarget).then(bitmaps -> 
     document.querySelector('img.output').src = bitmaps[0].io.toDataUrl();
  );
);
```

As you can see, bitmaps provide utilities to read from files, urls, or from HTMLInputElement (type==file) and also to write the output not only as files but also as base64, or data URL. 


## Transformations 

The purpose of the library is not only to provide easy image read/write but also basic transformations like resize, rotate, convolve, etc.


### Convolutions

The following example shows how to apply an edge detection, blur, and sharp filters. These kind of transformations are all based on [`bitmap.transform.convolve()`](https://cancerberosgx.github.io/bitmap/bitmap/transformation/Convolution.html):

```haxe
var edges = [
  [0.0, -1.0, 0.0],
  [-1.0, 4.0, -1.0],
  [0.0, -1.0, 0.0]
];
var edged = bitmap.transform.convolve({
    kernel: edges
});
var blurred = bitmap.transform.convolve(bitmap.transformation.Convolution.blur(7, 0.7));
```

### Affine transformations

[`bitmap.transform.affine()`](https://cancerberosgx.github.io/bitmap/bitmap/transformation/Affine.html) can be used to scale, rotate, skew a region of the image. In general you create a new Affine instance and apply several transformations to it, then call `bitmap.transform.affine()` to apply it over a Bitmap:

```haxe

import bitmap.transformation.Affine;
var result = bitmap.transform.affine({
  affine: new bitmap.transformation.Affine()
    .scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6)
});
```

Or also you can pass the affine transformation matrix directly:

```haxe
var result = bitmap.transform.affine({
  matrix: {
    a: 0.4,
    b: 0.5,
    c: 0.2,
    d: 1.5,
    e: 2.0,
    f: 3.0
  }
});
```
### Color filters

Bitmap colors can be also transformed, using [Colors transformations](https://cancerberosgx.github.io/bitmap/bitmap/transformation/Colors.html). Basically for each pixel these transformations will change each color channel (red, green, blue, alpha) values. There are some high level related utilities like Grayscale, but also users can declare how each channel will be changed using first order equations, JavaScript functions or even blending colors:

```haxe

var grayBitmap = PNGBitmap.create(IOUtil.readFile("colorfull.png")).color.grayScale();
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

## Tests

### Run locally

You will need java, php, g++, node.js to run all targets:

```sh
sh scripts/test.sh
```

### Run with docker

```sh
sh scripts/test-docker.sh
```

## Other scripts

```sh
sh scripts/clean.sh
sh scripts/pack.sh
sh scripts/publish.sh
```


## Status / TODO / Road map / Changelog

See [TODO.md](TODO.md)

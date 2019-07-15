# Bitmap

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [Usage](#usage)
  * [Transformations](#transformations)
- [Scripts](#scripts)
  * [Run tests locally](#run-tests-locally)
  * [Run tests with docker](#run-tests-with-docker)
  * [Other](#other)
- [Status](#status)
- [Tests](#tests)
  * [Run locally](#run-locally)
  * [Run with docker](#run-with-docker)
- [TODO](#todo)
  * [OT](#ot)
- [Notes](#notes)

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

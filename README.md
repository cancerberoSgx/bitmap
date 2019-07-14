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
 * Supports common formats (right now only PNG).
 * Pixel access, RGBA color, blending
 * Shape drawing.
 * Composition, convolution, color blending and more.
 * Stay tunned!

## Install

```sh
haxelib instal bitmap
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

## TODO

- [ ] browser example. load png from url, draw/transform and render it back again as img.
- [ ] fix haxe cookbook "macro combine structures" to support haxe 4 (Use ObjectField)
- [ ] check https://github.com/martamius/Exif.hx and see if with format.jpg read/write jpg could be supported
- [ ] export the library to other target's library by @:exposing public API( so non haxe users can also use it)
- [ ] dox
- [ ] code formatter
- [ ] bitmap.copy(bounds?:Rectangle):Bitmap
- [ ] bitmap.view(bounds?:Rectangle):Bitmap // returns a new Bitmap but using the same data so modifications will affect both
- [ ] bitmap.setOffset(bounds):Bitmap : offset support for bitmap: width, height, set, get methods in coordinates relative to `offset` property. Use case, work only on a region of the bitmap. Multiple bitmap referencing the same data
- [ ] bitmap.write(bitmap2, x, y)
- [ ] browser test n(sh test.sh should verify that at least the browser example renders whet it should,)
- [x] convolutions API
- [x] node & browser "pako is not defined" when used from other project
### OT

 * [ ] some math libraries: https://github.com/markknol/hx-vector2d/blob/master/src/geom/Vector2d.hx, https://github.com/tbrosman/hxmath/blob/master/test/Test2D.hx, https://github.com/ramchale/quick-haxe/blob/master/quick_haxe/path/Path.hx
 * geomtrize-haxe : may be checking with Sure is expensive so: implement macro or conditionals to not compile those statement if an option or compile arg is given.
 * haxe library to call ImageMagick commands in ALL targets (and browser). In non js targets user needs to have installed ImageMatick and we spawn. In the browser , with the same API, use https://www.npmjs.com/package/magica emscripten port of IM. 

## Notes

Convert from rgba to png:

convert -size 109x145 -depth 8 test/assets/tmptestdrawRectangle.rgba tmp2.png

Convert png to rgba

convert -depth 8 test/assets/n.png -depth 8 tmp2.rgba


# Bitmap

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [Usage](#usage)
- [Run tests](#run-tests)
  * [Run tests with docker](#run-tests-with-docker)
- [Status](#status)
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
## Usage

Use `-lib bitmap` in your projects.

The following example works on all targets but the browser since we are reading/writing files:

```haxe
import bitmap.*;
class Test {
  public static function test1() {
		var bitmap = PNGBitmap.create(IOUtil.readFile("imgs/input.png"));	
    bitmap.set(30, 20, Color.create(23, 233, 111, 128)); 	
    bitmap.draw.rectangle({x: 10, y: 20, width: 40, height: 22, c: Color.create(12, 144, 0, 131), fill: false});
    IOUtil.writeBitmap('imgs/output.png', bitmap);
  }
}
```

## Run tests

```sh
sh test.sh
```

### Run tests with docker

```sh
sh test-docker.sh
```

## Status

 * `Bitmap` types to create from haxe.io.Input and get/set pixel colors
 * `IOUtil`: basic utilities to read/write Input / Ouput and files supporting all haxe targets.
 * `PNGBitmap`: Supports read/write PNG images pixel formats: ARGB, RGBA
 * tests running in all targets.

## TODO

- [ ] check https://github.com/martamius/Exif.hx and see if with format.jpg read/write jpg could be supported
- [ ] export the library to other target's library by @:exposing public API
- [ ] bitmap.copy(bounds?:Rectangle):Bitmap
- [ ] bitmap.view(bounds?:Rectangle):Bitmap // returns a new Bitmap but using the same data so modifications will affect both
- [ ] bitmap.setOffset(bounds):Bitmap : offset support for bitmap: width, height, set, get methods in coordinates relative to `offset` property. Use case, work only on a region of the bitmap. Multiple bitmap referencing the same data
- [ ] bitmap.write(bitmap2, x, y)
- [ ] convolutions API

### OT

 * geomtrize-haxe : may be checking with Sure is expensive so: implement macro or conditionals to not compile those statement if an option or compile arg is given.

## Notes

Convert from rgba to png:

convert -size 109x145 -depth 8 test/assets/tmptestdrawRectangle.rgba tmp2.png

Convert png to rgba

convert -depth 8 test/assets/n.png -depth 8 tmp2.rgba


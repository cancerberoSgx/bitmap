# Bitmap

A library with high level API to access images and basic processing tools.

Supports all haxe targets.

## Install

```
haxelib instal bitmap
```

## Usage

```
haxe
```

## Status

 * `Bitmap` types to create from haxe.io.Input and get/set pixel colors
 * `IOUtil`: basic utilities to read/write Input / Ouput and files supporting all haxe targets.
 * `PNGBitmap`: Supports read/write PNG images pixel formats: ARGB, RGBA
 * tests running in all targets.

## TODO

- [ ] bitmap.read(bounds):Bitmap
- [ ] bitmap.setOffset(bounds):Bitmap : offset support for bitmap: width, height, set, get methods in coordinates relative to `offset` property. Use case, work only on a region of the bitmap. Multiple bitmap referencing the same data
- [ ] bitmap.write(bitmap, x, y)
- [ ] convolutions API
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

## Run tests

### Run tests with docker

```
# build docker image - only need to run once:
docker build -t bitmap-test test/docker/alpine-linux
# run tests in the container:
docker run --rm -it --workdir /code -v "$PWD":/code bitmap-test sh test/docker/test.sh 
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
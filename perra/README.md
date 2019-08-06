# Perra

**VERY WIP**
[Bitmap](https://github.com/cancerberoSgx/bitmap) haxe library as a JavaScript API directly generated from haxe -js target. Zero implementation. TypeScript definitions automatically generated. Plus, some tests.

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [API Reference](#api-reference)
- [Usage](#usage)
  * [Read and write images form file system](#read-and-write-images-form-file-system)
  * [Loading images with http requests / fetch()](#loading-images-with-http-requests--fetch)
  * [Fetching images from url, HTMLInputElement and rendering HTMLImage](#fetching-images-from-url-htmlinputelement-and-rendering-htmlimage)
- [Status / TODO / Road map / Changelog](#status--todo--road-map--changelog)

<!-- tocstop -->

## Summary 

 * See [Bitmap](https://github.com/cancerberoSgx/bitmap) - It has the same API and features.
 * Supports Node.js and browser
 * TODO

## Install

```sh
haxelib install perra
```

## API Reference

 * The API and features are the same as [Bitmap](https://github.com/cancerberoSgx/bitmap) so check there for reference API while here there's is none.
<!-- [API Reference](https://cancerberosgx.github.io/bitmap/index.html) -->
TODO

## Usage
This section show the basic API of the library. 

Since API and features the same as [Bitmap](https://github.com/cancerberoSgx/bitmap)  check there for details and API while here there's is none.

### Read and write images form file system

(Node.js only)

```ts
import { IOUtil, PNGBitmap, Color, BitmapIO } from 'perra'
(async ()=>{
  var bitmap = PNGBitmap.create(IOUtil.readFile('input.png'))
  bitmap.draw.rectangle2(10, 10, 30, 30, Color.create(20, 200, 10, 128), true)
  BitmapIO.writeBitmap('out.png', bitmap)
})()
```

### Loading images with http requests / fetch() 

(Node.js and Browser)

```ts
import { IOUtil, PNGBitmap, Color, BitmapIO } from 'perra'
(async ()=>{
  var bitmap = PNGBitmap.create(IOUtil.readFile('input.png'))
  bitmap.draw.rectangle2(10, 10, 30, 30, Color.create(20, 200, 10, 128), true)
  BitmapIO.writeBitmap('out.png', bitmap)
})()
```

### Fetching images from url, HTMLInputElement and rendering HTMLImage 

(browser only)

```ts
import { bitmap as P } from 'perra'

var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png';
P.IOUtil.fetch(url, async (err , data) => {


  if (err != null) {
    return t.end(err)
  }
  var bitmap = bitmap.PNGBitmap.create(data)
  var {result} = bitmap.transform.affine({
    affine: new bitmap.transformation.Affine()
      .scale(0.5, 0.3).translate(222, 211).rotateDeg(35.6)
  })
  document.
  t.deepEqual(BitmapUtil.compare(bitmap, PNGBitmap.create(IOUtil.readFile('test/assets/parrots_orig.png'))), 0)
  BitmapIO.writeBitmap('tmp_ww.png', bitmap)
  t.true(await imageCompare(await File.fromFile('tmp_ww.png'), await File.fromFile('test/assets/parrots_orig.png')))
})
```



render to HTMLImageelement
```ts
<img class="input" src="${this.props.state.bitmap.io.toDataUrl()}"/>
```

loading images form HTMLInputElement
```ts

queryOne('.loadFile').addEventListener('change', e -> {
			BitmapIO.readHtmlInputFile(e.currentTarget).then(bitmaps -> Store.getInstance().setState({
					example: this.props.state.example,
					output: [for (i in 0...5) bitmaps[0].clone()],
					bitmap: bitmaps[0]
				}));
    });
```
    

## Status / TODO / Road map / Changelog

See [TODO.md](TODO.md)

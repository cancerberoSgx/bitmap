# Perra

JavaScript Image Processing library for Node.js and Browsers. TypeScript support. Pure JavaScript implementation and TypeScript Definitions generated automatically [Bitmap](https://github.com/cancerberoSgx/bitmap) haxe library.

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [API Reference](#api-reference)
- [Usage](#usage)
  * [Read and write images from file system](#read-and-write-images-from-file-system)
  * [Fetching images from URL](#fetching-images-from-url)
  * [Loading images from HTMLInputElement, HTMLCanvasElement, HTMLImageElement](#loading-images-from-htmlinputelement-htmlcanvaselement-htmlimageelement)

<!-- tocstop -->

## Summary 

 * **VERY WIP**
 * Generated automatically  [Bitmap](https://github.com/cancerberoSgx/bitmap) haxe library.
 * This is a Zero implementation package, only declare types and implements Some tests. 
 * See [Bitmap](https://github.com/cancerberoSgx/bitmap) - It has the same API and features.
 * Both JavaScript library bundle file and TypeScript definitions automatically generated.

## Install

```sh
npm install perra
```

## API Reference

[API Reference](https://github.com/cancerberoSgx/bitmap/blob/master/perra/apidocs/modules/_bitmap_d_.bitmap.md)

 * The API and features are the same as [Bitmap](https://github.com/cancerberoSgx/bitmap).

## Usage

This section show the basic API of the library. 

Since API and features the same as [Bitmap](https://github.com/cancerberoSgx/bitmap)  check there for details and API while here there's is none.

### Read and write images from file system

(Node.js only)

```ts
import { IOUtil, PNGBitmap, Color, BitmapIO } from 'perra'
(async ()=>{
  var bitmap = PNGBitmap.create(IOUtil.readFile('input.png'))
  bitmap.draw.rectangle2(10, 10, 30, 30, Color.create(20, 200, 10, 128), true)
  BitmapIO.writeBitmap('out.png', bitmap)
})()
```

### Fetching images from URL

(Node.js and Browser)

(in node.js URLs must be absolute while in browsers fetching from external servers needs to support CORs requests)

```ts
import { bitmap as P } from 'perra'

var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png';
P.IOUtil.fetch(url, async (err , data) => {
  if (err != null) {
    console.error('Error reading image ', err)
    return
  }
  var bitmap = bitmap.PNGBitmap.create(data)
})
```

### Loading images from HTMLInputElement, HTMLCanvasElement, HTMLImageElement

(Browser only)

TODO

<!-- queryOne('.loadFile').addEventListener('change', e -> {
			BitmapIO.readHtmlInputFile(e.currentTarget).then(bitmaps -> Store.getInstance().setState({
					example: this.props.state.example,
					output: [for (i in 0...5) bitmaps[0].clone()],
					bitmap: bitmaps[0]
				}));
    });
``` -->

### Rendering in HTMLCanvasElement, HTMLImageElement

(Browser only)

TODO

<!-- <img class="input" src="${this.props.state.bitmap.io.toDataUrl()}"/> -->


## Status / TODO / Road map / Changelog

See [TODO.md](TODO.md)

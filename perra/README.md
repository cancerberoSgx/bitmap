# Perra

**VERY WIP**
[Bitmap](https://github.com/cancerberoSgx/bitmap) haxe library as a JavaScript API directly generated from haxe -js target. Zero implementation. TypeScript definitions automatically generated. Plus, some tests.

## Contents

<!-- toc -->

- [Summary](#summary)
- [Install](#install)
- [API Reference](#api-reference)
- [Usage](#usage)
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

<!-- [API Reference](https://cancerberosgx.github.io/bitmap/index.html) -->
TODO

## Usage

```ts
import { IOUtil, PNGBitmap, Color, BitmapIO } from '../src'

test('importing using namespace', async t => {
  var f = await nDraw('test/assets/n.png', 'tmp2.png')
  t.true(await f!.equals(await File.fromFile('test/assets/rect1.png')))
})

test('importing directly', async t => {
  var f = await nDraw('test/assets/n.png', 'tmp1.png')
  t.true(await f!.equals(await File.fromFile('test/assets/rect1.png')))
})

async function nDraw(inputFile: string, n: string) {
  const input = IOUtil.readFile(inputFile)
  var b = PNGBitmap.create(input)
  b.draw.rectangle2(10, 10, 30, 30, Color.create(20, 200, 10, 128), true)
  BitmapIO.writeBitmap(n, b)
  return await File.fromFile(n)
}
```
TODO

## Status / TODO / Road map / Changelog

See [TODO.md](TODO.md)

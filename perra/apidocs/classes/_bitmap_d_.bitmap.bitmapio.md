[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [BitmapIO](_bitmap_d_.bitmap.bitmapio.md)

# Class: BitmapIO

Utilities to load/save bitmaps from/to other formats or resources, such as base64 dataUrls, raw bytes formats, HTML canvas, HTML images, DOM Blobs, TypedArrays, buffers, urls, etc.

## Hierarchy

* **BitmapIO**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.bitmapio.md#constructor)

### Methods

* [fromBase64](_bitmap_d_.bitmap.bitmapio.md#frombase64)
* [fromDataUrl](_bitmap_d_.bitmap.bitmapio.md#fromdataurl)
* [toBase64](_bitmap_d_.bitmap.bitmapio.md#tobase64)
* [toDataUrl](_bitmap_d_.bitmap.bitmapio.md#todataurl)
* [fromFile](_bitmap_d_.bitmap.bitmapio.md#static-fromfile)
* [fromUrl](_bitmap_d_.bitmap.bitmapio.md#static-fromurl)
* [readHtmlInputFile](_bitmap_d_.bitmap.bitmapio.md#static-readhtmlinputfile)
* [writeBitmap](_bitmap_d_.bitmap.bitmapio.md#static-writebitmap)

## Constructors

###  constructor

\+ **new BitmapIO**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[BitmapIO](_bitmap_d_.bitmap.bitmapio.md)*

*Defined in [bitmap.d.ts:518](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L518)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[BitmapIO](_bitmap_d_.bitmap.bitmapio.md)*

## Methods

###  fromBase64

▸ **fromBase64**(`base64`: string): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:531](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L531)*

Loads bitmap from given base64 string.

**Parameters:**

Name | Type |
------ | ------ |
`base64` | string |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  fromDataUrl

▸ **fromDataUrl**(`dataurl`: string): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:535](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L535)*

Loads bitmap from given data url string.

**Parameters:**

Name | Type |
------ | ------ |
`dataurl` | string |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  toBase64

▸ **toBase64**(): *string*

*Defined in [bitmap.d.ts:527](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L527)*

Returns base64 representation of this image in an ecoded format like PNG

**Returns:** *string*

___

###  toDataUrl

▸ **toDataUrl**(`mime`: string, `name?`: undefined | string): *string*

*Defined in [bitmap.d.ts:523](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L523)*

Creates a DataUrl like `data:image/png;name=f.png;base64,` using given base64 content, mimeType and fileName.

**Parameters:**

Name | Type |
------ | ------ |
`mime` | string |
`name?` | undefined &#124; string |

**Returns:** *string*

___

### `Static` fromFile

▸ **fromFile**(`path`: string): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:542](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L542)*

**Parameters:**

Name | Type |
------ | ------ |
`path` | string |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

### `Static` fromUrl

▸ **fromUrl**(`url`: string): *[Promise](_bitmap_d_.bitmap.support.promise.md)‹[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)›*

*Defined in [bitmap.d.ts:541](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L541)*

**Parameters:**

Name | Type |
------ | ------ |
`url` | string |

**Returns:** *[Promise](_bitmap_d_.bitmap.support.promise.md)‹[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)›*

___

### `Static` readHtmlInputFile

▸ **readHtmlInputFile**(`el`: HTMLInputElement): *Promise‹[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)[]›*

*Defined in [bitmap.d.ts:539](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L539)*

Loads bitmaps from files in html input element of type "file"

**Parameters:**

Name | Type |
------ | ------ |
`el` | HTMLInputElement |

**Returns:** *Promise‹[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)[]›*

___

### `Static` writeBitmap

▸ **writeBitmap**(`file`: string, `bitmap`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *void*

*Defined in [bitmap.d.ts:540](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L540)*

**Parameters:**

Name | Type |
------ | ------ |
`file` | string |
`bitmap` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *void*

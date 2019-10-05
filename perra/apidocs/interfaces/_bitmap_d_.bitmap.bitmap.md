[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [Bitmap](_bitmap_d_.bitmap.bitmap.md)

# Interface: Bitmap

## Hierarchy

  ↳ [OffsetRectangleArea](_bitmap_d_.bitmap.offsetrectanglearea.md)

  ↳ **Bitmap**

## Implemented by

* [AbstractBitmap](../classes/_bitmap_d_.bitmap.abstractbitmap.md)
* [PNGBitmap](../classes/_bitmap_d_.bitmap.pngbitmap.md)

## Index

### Properties

* [bg](_bitmap_d_.bitmap.bitmap.md#bg)
* [color](_bitmap_d_.bitmap.bitmap.md#color)
* [data](_bitmap_d_.bitmap.bitmap.md#data)
* [draw](_bitmap_d_.bitmap.bitmap.md#draw)
* [height](_bitmap_d_.bitmap.bitmap.md#height)
* [io](_bitmap_d_.bitmap.bitmap.md#io)
* [noRangeCheck](_bitmap_d_.bitmap.bitmap.md#norangecheck)
* [originalHeight](_bitmap_d_.bitmap.bitmap.md#originalheight)
* [originalWidth](_bitmap_d_.bitmap.bitmap.md#originalwidth)
* [transform](_bitmap_d_.bitmap.bitmap.md#transform)
* [width](_bitmap_d_.bitmap.bitmap.md#width)

### Methods

* [bounds](_bitmap_d_.bitmap.bitmap.md#bounds)
* [clone](_bitmap_d_.bitmap.bitmap.md#clone)
* [compare](_bitmap_d_.bitmap.bitmap.md#compare)
* [copy](_bitmap_d_.bitmap.bitmap.md#copy)
* [copyFrom](_bitmap_d_.bitmap.bitmap.md#copyfrom)
* [equals](_bitmap_d_.bitmap.bitmap.md#equals)
* [fill](_bitmap_d_.bitmap.bitmap.md#fill)
* [get](_bitmap_d_.bitmap.bitmap.md#get)
* [load](_bitmap_d_.bitmap.bitmap.md#load)
* [save](_bitmap_d_.bitmap.bitmap.md#save)
* [set](_bitmap_d_.bitmap.bitmap.md#set)

## Properties

###  bg

• **bg**: *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:430](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L430)*

Default color for this bitmap background. It's used in some operations like copy/clone as default background color in some cases.

___

###  color

• **color**: *[Colors](../classes/_bitmap_d_.bitmap.transformation.colors.md)*

*Defined in [bitmap.d.ts:418](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L418)*

Color related utilities like channel filters, blend, etc.

___

###  data

• **data**: *[Bytes](../classes/_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:406](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L406)*

image bitmap Raw bytes in RGBA int32 format.

___

###  draw

• **draw**: *[Draw](../classes/_bitmap_d_.bitmap.draw.md)*

*Defined in [bitmap.d.ts:414](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L414)*

Drawing utilities.

___

###  height

• **height**: *number*

*Inherited from [RectangleArea](_bitmap_d_.bitmap.rectanglearea.md).[height](_bitmap_d_.bitmap.rectanglearea.md#height)*

*Defined in [bitmap.d.ts:6](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L6)*

___

###  io

• **io**: *[BitmapIO](../classes/_bitmap_d_.bitmap.bitmapio.md)*

*Defined in [bitmap.d.ts:426](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L426)*

Utilities to load/save bitmaps from/to other formats or resources, such as base64 dataUrls, raw bytes formats, HTML canvas, HTML images, DOM Blobs, TypedArrays, buffers, urls, etc.

___

###  noRangeCheck

• **noRangeCheck**: *boolean*

*Defined in [bitmap.d.ts:410](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L410)*

If true operationsn won't throw exceptions in case given coordinates for get/set are outside bitmap.

___

###  originalHeight

• **originalHeight**: *number*

*Inherited from [OffsetRectangleArea](_bitmap_d_.bitmap.offsetrectanglearea.md).[originalHeight](_bitmap_d_.bitmap.offsetrectanglearea.md#originalheight)*

*Defined in [bitmap.d.ts:13](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L13)*

___

###  originalWidth

• **originalWidth**: *number*

*Inherited from [OffsetRectangleArea](_bitmap_d_.bitmap.offsetrectanglearea.md).[originalWidth](_bitmap_d_.bitmap.offsetrectanglearea.md#originalwidth)*

*Defined in [bitmap.d.ts:12](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L12)*

___

###  transform

• **transform**: *[Transform](../classes/_bitmap_d_.bitmap.transformation.transform.md)*

*Defined in [bitmap.d.ts:422](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L422)*

Transform utilities like convolve, affine, etc.

___

###  width

• **width**: *number*

*Inherited from [RectangleArea](_bitmap_d_.bitmap.rectanglearea.md).[width](_bitmap_d_.bitmap.rectanglearea.md#width)*

*Defined in [bitmap.d.ts:5](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L5)*

## Methods

###  bounds

▸ **bounds**(): *[Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)*

*Defined in [bitmap.d.ts:466](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L466)*

**Returns:** *[Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)*

___

###  clone

▸ **clone**(`fillBg`: boolean): *[Bitmap](_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:458](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L458)*

Returns a new bitmap that is a copy of this one with exactly the same pixels.

**Parameters:**

Name | Type |
------ | ------ |
`fillBg` | boolean |

**Returns:** *[Bitmap](_bitmap_d_.bitmap.bitmap.md)*

___

###  compare

▸ **compare**(`b`: [Bitmap](_bitmap_d_.bitmap.bitmap.md), `regionA?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle), `thisRegion?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *number*

*Defined in [bitmap.d.ts:465](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L465)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](_bitmap_d_.bitmap.bitmap.md) |
`regionA?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |
`thisRegion?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *number*

___

###  copy

▸ **copy**(`r`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *[Bitmap](_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:464](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L464)*

**Parameters:**

Name | Type |
------ | ------ |
`r` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *[Bitmap](_bitmap_d_.bitmap.bitmap.md)*

___

###  copyFrom

▸ **copyFrom**(`b`: [Bitmap](_bitmap_d_.bitmap.bitmap.md), `bCoords`: [Point](../modules/_bitmap_d_.bitmap.md#point), `regionThis`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *void*

*Defined in [bitmap.d.ts:462](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L462)*

Writes in this bitmap given region of given bitmap, or if no region is given, the bitmap entirely.

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](_bitmap_d_.bitmap.bitmap.md) |
`bCoords` | [Point](../modules/_bitmap_d_.bitmap.md#point) |
`regionThis` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *void*

___

###  equals

▸ **equals**(`b`: [Bitmap](_bitmap_d_.bitmap.bitmap.md), `region?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *boolean*

*Defined in [bitmap.d.ts:454](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L454)*

Returns true if this bitmap and given one are exactly equal (pixel by pixel).

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](_bitmap_d_.bitmap.bitmap.md) |
`region?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *boolean*

___

###  fill

▸ **fill**(`bg`: [Color](../modules/_bitmap_d_.bitmap.md#color)): *void*

*Defined in [bitmap.d.ts:463](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L463)*

**Parameters:**

Name | Type |
------ | ------ |
`bg` | [Color](../modules/_bitmap_d_.bitmap.md#color) |

**Returns:** *void*

___

###  get

▸ **get**(`x`: number, `y`: number, `noError?`: undefined | false | true): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:445](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L445)*

Gets pixel color at x,y.

By default if coords are out of bounds it will throw error. This can be prevented
passing noError==true. In that case, if the error happens it will return true, otherwise false.

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`noError?` | undefined &#124; false &#124; true |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

###  load

▸ **load**(`input`: [Input](../classes/_bitmap_d_.haxe.io.input.md), `format?`: any): *void*

*Defined in [bitmap.d.ts:434](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L434)*

Loads an image form given input.

**Parameters:**

Name | Type |
------ | ------ |
`input` | [Input](../classes/_bitmap_d_.haxe.io.input.md) |
`format?` | any |

**Returns:** *void*

___

###  save

▸ **save**(`output`: [Output](../classes/_bitmap_d_.haxe.io.output.md)): *void*

*Defined in [bitmap.d.ts:438](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L438)*

Saves current bitmap to given output.

**Parameters:**

Name | Type |
------ | ------ |
`output` | [Output](../classes/_bitmap_d_.haxe.io.output.md) |

**Returns:** *void*

___

###  set

▸ **set**(`x`: number, `y`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `noError?`: undefined | false | true): *boolean*

*Defined in [bitmap.d.ts:450](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L450)*

By default if coords are out of bounds it will throw error. This can be prevented
passing noError==true. In that case, if the error happens it will return true, otherwise false.

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`noError?` | undefined &#124; false &#124; true |

**Returns:** *boolean*

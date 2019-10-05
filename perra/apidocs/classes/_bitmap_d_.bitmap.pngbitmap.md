[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)

# Class: PNGBitmap

## Hierarchy

* [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md)

  ↳ **PNGBitmap**

## Implements

* [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.pngbitmap.md#constructor)

### Properties

* [bg](_bitmap_d_.bitmap.pngbitmap.md#bg)
* [color](_bitmap_d_.bitmap.pngbitmap.md#color)
* [data](_bitmap_d_.bitmap.pngbitmap.md#data)
* [draw](_bitmap_d_.bitmap.pngbitmap.md#draw)
* [format](_bitmap_d_.bitmap.pngbitmap.md#format)
* [height](_bitmap_d_.bitmap.pngbitmap.md#height)
* [int32Mode](_bitmap_d_.bitmap.pngbitmap.md#int32mode)
* [io](_bitmap_d_.bitmap.pngbitmap.md#io)
* [noRangeCheck](_bitmap_d_.bitmap.pngbitmap.md#norangecheck)
* [originalHeight](_bitmap_d_.bitmap.pngbitmap.md#originalheight)
* [originalWidth](_bitmap_d_.bitmap.pngbitmap.md#originalwidth)
* [transform](_bitmap_d_.bitmap.pngbitmap.md#transform)
* [width](_bitmap_d_.bitmap.pngbitmap.md#width)

### Methods

* [bounds](_bitmap_d_.bitmap.pngbitmap.md#bounds)
* [byteIndex](_bitmap_d_.bitmap.pngbitmap.md#byteindex)
* [clone](_bitmap_d_.bitmap.pngbitmap.md#clone)
* [compare](_bitmap_d_.bitmap.pngbitmap.md#compare)
* [copy](_bitmap_d_.bitmap.pngbitmap.md#copy)
* [copyFrom](_bitmap_d_.bitmap.pngbitmap.md#copyfrom)
* [equals](_bitmap_d_.bitmap.pngbitmap.md#equals)
* [fill](_bitmap_d_.bitmap.pngbitmap.md#fill)
* [get](_bitmap_d_.bitmap.pngbitmap.md#get)
* [load](_bitmap_d_.bitmap.pngbitmap.md#load)
* [save](_bitmap_d_.bitmap.pngbitmap.md#save)
* [set](_bitmap_d_.bitmap.pngbitmap.md#set)
* [toString](_bitmap_d_.bitmap.pngbitmap.md#tostring)
* [create](_bitmap_d_.bitmap.pngbitmap.md#static-create)

## Constructors

###  constructor

\+ **new PNGBitmap**(`w`: number, `h?`: undefined | number, `f?`: any): *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

*Overrides [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[constructor](_bitmap_d_.bitmap.abstractbitmap.md#constructor)*

*Defined in [bitmap.d.ts:771](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L771)*

**Parameters:**

Name | Type |
------ | ------ |
`w` | number |
`h?` | undefined &#124; number |
`f?` | any |

**Returns:** *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

## Properties

###  bg

• **bg**: *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[bg](../interfaces/_bitmap_d_.bitmap.bitmap.md#bg)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[bg](_bitmap_d_.bitmap.abstractbitmap.md#bg)*

*Defined in [bitmap.d.ts:488](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L488)*

___

###  color

• **color**: *[Colors](_bitmap_d_.bitmap.transformation.colors.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[color](../interfaces/_bitmap_d_.bitmap.bitmap.md#color)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[color](_bitmap_d_.bitmap.abstractbitmap.md#color)*

*Defined in [bitmap.d.ts:486](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L486)*

___

###  data

• **data**: *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[data](../interfaces/_bitmap_d_.bitmap.bitmap.md#data)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[data](_bitmap_d_.bitmap.abstractbitmap.md#data)*

*Defined in [bitmap.d.ts:478](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L478)*

___

###  draw

• **draw**: *[Draw](_bitmap_d_.bitmap.draw.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[draw](../interfaces/_bitmap_d_.bitmap.bitmap.md#draw)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[draw](_bitmap_d_.bitmap.abstractbitmap.md#draw)*

*Defined in [bitmap.d.ts:484](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L484)*

___

###  format

• **format**: *any*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[format](_bitmap_d_.bitmap.abstractbitmap.md#format)*

*Defined in [bitmap.d.ts:483](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L483)*

___

###  height

• **height**: *number*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[height](../interfaces/_bitmap_d_.bitmap.bitmap.md#height)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[height](_bitmap_d_.bitmap.abstractbitmap.md#height)*

*Defined in [bitmap.d.ts:480](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L480)*

___

###  int32Mode

• **int32Mode**: *boolean*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[int32Mode](_bitmap_d_.bitmap.abstractbitmap.md#int32mode)*

*Defined in [bitmap.d.ts:477](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L477)*

Switch between byte-by-byte and int32 modalities for reading and writing pixels with get/set.

___

###  io

• **io**: *[BitmapIO](_bitmap_d_.bitmap.bitmapio.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[io](../interfaces/_bitmap_d_.bitmap.bitmap.md#io)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[io](_bitmap_d_.bitmap.abstractbitmap.md#io)*

*Defined in [bitmap.d.ts:485](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L485)*

___

###  noRangeCheck

• **noRangeCheck**: *boolean*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[noRangeCheck](../interfaces/_bitmap_d_.bitmap.bitmap.md#norangecheck)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[noRangeCheck](_bitmap_d_.bitmap.abstractbitmap.md#norangecheck)*

*Defined in [bitmap.d.ts:473](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L473)*

___

###  originalHeight

• **originalHeight**: *number*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[originalHeight](../interfaces/_bitmap_d_.bitmap.bitmap.md#originalheight)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[originalHeight](_bitmap_d_.bitmap.abstractbitmap.md#originalheight)*

*Defined in [bitmap.d.ts:482](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L482)*

___

###  originalWidth

• **originalWidth**: *number*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[originalWidth](../interfaces/_bitmap_d_.bitmap.bitmap.md#originalwidth)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[originalWidth](_bitmap_d_.bitmap.abstractbitmap.md#originalwidth)*

*Defined in [bitmap.d.ts:481](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L481)*

___

###  transform

• **transform**: *[Transform](_bitmap_d_.bitmap.transformation.transform.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[transform](../interfaces/_bitmap_d_.bitmap.bitmap.md#transform)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[transform](_bitmap_d_.bitmap.abstractbitmap.md#transform)*

*Defined in [bitmap.d.ts:487](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L487)*

___

###  width

• **width**: *number*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md).[width](../interfaces/_bitmap_d_.bitmap.bitmap.md#width)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[width](_bitmap_d_.bitmap.abstractbitmap.md#width)*

*Defined in [bitmap.d.ts:479](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L479)*

## Methods

###  bounds

▸ **bounds**(): *[Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[bounds](_bitmap_d_.bitmap.abstractbitmap.md#bounds)*

*Defined in [bitmap.d.ts:501](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L501)*

**Returns:** *[Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)*

___

###  byteIndex

▸ **byteIndex**(`x`: number, `y`: number): *number*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[byteIndex](_bitmap_d_.bitmap.abstractbitmap.md#byteindex)*

*Defined in [bitmap.d.ts:492](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L492)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |

**Returns:** *number*

___

###  clone

▸ **clone**(`fill_`: boolean): *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[clone](_bitmap_d_.bitmap.abstractbitmap.md#clone)*

*Defined in [bitmap.d.ts:497](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L497)*

**Parameters:**

Name | Type |
------ | ------ |
`fill_` | boolean |

**Returns:** *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

___

###  compare

▸ **compare**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `regionB?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle), `thisRegion?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *number*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[compare](_bitmap_d_.bitmap.abstractbitmap.md#compare)*

*Defined in [bitmap.d.ts:500](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L500)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`regionB?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |
`thisRegion?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *number*

___

###  copy

▸ **copy**(`r`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Overrides [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[copy](_bitmap_d_.bitmap.abstractbitmap.md#copy)*

*Defined in [bitmap.d.ts:775](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L775)*

**Parameters:**

Name | Type |
------ | ------ |
`r` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  copyFrom

▸ **copyFrom**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `bCoords`: [Point](../modules/_bitmap_d_.bitmap.md#point), `regionThis`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *void*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[copyFrom](_bitmap_d_.bitmap.abstractbitmap.md#copyfrom)*

*Defined in [bitmap.d.ts:499](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L499)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`bCoords` | [Point](../modules/_bitmap_d_.bitmap.md#point) |
`regionThis` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *void*

___

###  equals

▸ **equals**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `region?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *boolean*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[equals](_bitmap_d_.bitmap.abstractbitmap.md#equals)*

*Defined in [bitmap.d.ts:498](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L498)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`region?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *boolean*

___

###  fill

▸ **fill**(`bg_`: [Color](../modules/_bitmap_d_.bitmap.md#color)): *void*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[fill](_bitmap_d_.bitmap.abstractbitmap.md#fill)*

*Defined in [bitmap.d.ts:489](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L489)*

**Parameters:**

Name | Type |
------ | ------ |
`bg_` | [Color](../modules/_bitmap_d_.bitmap.md#color) |

**Returns:** *void*

___

###  get

▸ **get**(`x`: number, `y`: number, `noError?`: undefined | false | true): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[get](_bitmap_d_.bitmap.abstractbitmap.md#get)*

*Defined in [bitmap.d.ts:490](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L490)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`noError?` | undefined &#124; false &#124; true |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

###  load

▸ **load**(`input`: [Input](_bitmap_d_.haxe.io.input.md), `f?`: any): *void*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Overrides [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[load](_bitmap_d_.bitmap.abstractbitmap.md#load)*

*Defined in [bitmap.d.ts:773](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L773)*

**Parameters:**

Name | Type |
------ | ------ |
`input` | [Input](_bitmap_d_.haxe.io.input.md) |
`f?` | any |

**Returns:** *void*

___

###  save

▸ **save**(`output`: [Output](_bitmap_d_.haxe.io.output.md)): *void*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Overrides [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[save](_bitmap_d_.bitmap.abstractbitmap.md#save)*

*Defined in [bitmap.d.ts:774](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L774)*

**Parameters:**

Name | Type |
------ | ------ |
`output` | [Output](_bitmap_d_.haxe.io.output.md) |

**Returns:** *void*

___

###  set

▸ **set**(`x`: number, `y`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `noError?`: undefined | false | true): *boolean*

*Implementation of [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[set](_bitmap_d_.bitmap.abstractbitmap.md#set)*

*Defined in [bitmap.d.ts:494](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L494)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`noError?` | undefined &#124; false &#124; true |

**Returns:** *boolean*

___

###  toString

▸ **toString**(): *string*

*Inherited from [AbstractBitmap](_bitmap_d_.bitmap.abstractbitmap.md).[toString](_bitmap_d_.bitmap.abstractbitmap.md#tostring)*

*Defined in [bitmap.d.ts:491](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L491)*

**Returns:** *string*

___

### `Static` create

▸ **create**(`input`: [Input](_bitmap_d_.haxe.io.input.md), `format?`: any): *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

*Defined in [bitmap.d.ts:776](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L776)*

**Parameters:**

Name | Type |
------ | ------ |
`input` | [Input](_bitmap_d_.haxe.io.input.md) |
`format?` | any |

**Returns:** *[PNGBitmap](_bitmap_d_.bitmap.pngbitmap.md)*

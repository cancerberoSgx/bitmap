[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [BitmapUtil](_bitmap_d_.bitmap.bitmaputil.md)

# Class: BitmapUtil

## Hierarchy

* **BitmapUtil**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.bitmaputil.md#protected-constructor)

### Methods

* [bitmapEquals](_bitmap_d_.bitmap.bitmaputil.md#static-bitmapequals)
* [blend](_bitmap_d_.bitmap.bitmaputil.md#static-blend)
* [compare](_bitmap_d_.bitmap.bitmaputil.md#static-compare)
* [fromBase64](_bitmap_d_.bitmap.bitmaputil.md#static-frombase64)
* [fromDataUrl](_bitmap_d_.bitmap.bitmaputil.md#static-fromdataurl)
* [toBase64](_bitmap_d_.bitmap.bitmaputil.md#static-tobase64)
* [toDataUrl](_bitmap_d_.bitmap.bitmaputil.md#static-todataurl)

## Constructors

### `Protected` constructor

\+ **new BitmapUtil**(): *[BitmapUtil](_bitmap_d_.bitmap.bitmaputil.md)*

*Defined in [bitmap.d.ts:547](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L547)*

**Returns:** *[BitmapUtil](_bitmap_d_.bitmap.bitmaputil.md)*

## Methods

### `Static` bitmapEquals

▸ **bitmapEquals**(`a`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `region?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *boolean*

*Defined in [bitmap.d.ts:549](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L549)*

**Parameters:**

Name | Type |
------ | ------ |
`a` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`region?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *boolean*

___

### `Static` blend

▸ **blend**(`b1`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `b2`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `b3`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:555](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L555)*

**Parameters:**

Name | Type |
------ | ------ |
`b1` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`b2` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`b3` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

### `Static` compare

▸ **compare**(`a`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `regionA?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle), `regionB?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *number*

*Defined in [bitmap.d.ts:554](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L554)*

Compares given region of given Bitmaps. Returns a number between -1 and 1, the biger its absolute value the bigger the difference. If negative it means the sum of a's bytes is bigger than b's, possitive otherwise.
TODO : fix this is not working fine

**Parameters:**

Name | Type |
------ | ------ |
`a` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`regionA?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |
`regionB?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *number*

___

### `Static` fromBase64

▸ **fromBase64**(`base64`: string, `bitmap?`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:567](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L567)*

Loads bitmap from given base64 string.

**Parameters:**

Name | Type |
------ | ------ |
`base64` | string |
`bitmap?` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

### `Static` fromDataUrl

▸ **fromDataUrl**(`dataurl`: string, `bitmap?`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:571](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L571)*

Loads bitmap from given data url string.

**Parameters:**

Name | Type |
------ | ------ |
`dataurl` | string |
`bitmap?` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

### `Static` toBase64

▸ **toBase64**(`bitmap`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *string*

*Defined in [bitmap.d.ts:563](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L563)*

Returns base64 representation of this image in an ecoded format like PNG

**Parameters:**

Name | Type |
------ | ------ |
`bitmap` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *string*

___

### `Static` toDataUrl

▸ **toDataUrl**(`bitmap`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `mime?`: undefined | string, `name?`: undefined | string): *string*

*Defined in [bitmap.d.ts:559](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L559)*

Creates a DataUrl like `data:image/png;name=f.png;base64,` using given base64 content, mimeType and fileName.

**Parameters:**

Name | Type |
------ | ------ |
`bitmap` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |
`mime?` | undefined &#124; string |
`name?` | undefined &#124; string |

**Returns:** *string*

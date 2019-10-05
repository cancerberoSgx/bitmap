[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [ColorUtil](_bitmap_d_.bitmap.colorutil.md)

# Class: ColorUtil

## Hierarchy

* **ColorUtil**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.colorutil.md#protected-constructor)

### Methods

* [mix](_bitmap_d_.bitmap.colorutil.md#mix)
* [average](_bitmap_d_.bitmap.colorutil.md#static-average)
* [blendColors](_bitmap_d_.bitmap.colorutil.md#static-blendcolors)
* [colorEquals](_bitmap_d_.bitmap.colorutil.md#static-colorequals)
* [filter](_bitmap_d_.bitmap.colorutil.md#static-filter)
* [random](_bitmap_d_.bitmap.colorutil.md#static-random)
* [randomGray](_bitmap_d_.bitmap.colorutil.md#static-randomgray)

## Constructors

### `Protected` constructor

\+ **new ColorUtil**(): *[ColorUtil](_bitmap_d_.bitmap.colorutil.md)*

*Defined in [bitmap.d.ts:653](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L653)*

**Returns:** *[ColorUtil](_bitmap_d_.bitmap.colorutil.md)*

## Methods

###  mix

▸ **mix**(`c1`: [Color](../modules/_bitmap_d_.bitmap.md#color), `c2`: [Color](../modules/_bitmap_d_.bitmap.md#color), `strength`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:655](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L655)*

**Parameters:**

Name | Type |
------ | ------ |
`c1` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`c2` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`strength` | number |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` average

▸ **average**(`image`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md), `region?`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle), `alpha?`: undefined | number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:663](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L663)*

Computes the average RGB color of the pixels in the image.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`image` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) | The image whose average color will be calculated. |
`region?` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) | - |
`alpha?` | undefined &#124; number | The opacity of the image (0-255), defaults to opaque (255). |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

The average RGB color of the image, RGBA8888 format. Alpha defaults to opaque (255).

___

### `Static` blendColors

▸ **blendColors**(`c1`: [Color](../modules/_bitmap_d_.bitmap.md#color), `c2`: [Color](../modules/_bitmap_d_.bitmap.md#color), `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend)): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:669](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L669)*

Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) .

**Parameters:**

Name | Type |
------ | ------ |
`c1` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`c2` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` colorEquals

▸ **colorEquals**(`a`: [Color](../modules/_bitmap_d_.bitmap.md#color), `b`: [Color](../modules/_bitmap_d_.bitmap.md#color)): *boolean*

*Defined in [bitmap.d.ts:656](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L656)*

**Parameters:**

Name | Type |
------ | ------ |
`a` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`b` | [Color](../modules/_bitmap_d_.bitmap.md#color) |

**Returns:** *boolean*

___

### `Static` filter

▸ **filter**(`c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `o`: [ColorFilter](../modules/_bitmap_d_.bitmap.md#colorfilter)): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:673](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L673)*

Supports filter declarations by providing a function `fn` that transform colors to colors, or if not given, alternatively it supports providing 1-grade equation coeficients to transform each channel linearly (red*a+c).

**Parameters:**

Name | Type |
------ | ------ |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`o` | [ColorFilter](../modules/_bitmap_d_.bitmap.md#colorfilter) |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` random

▸ **random**(`alpha`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:664](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L664)*

**Parameters:**

Name | Type |
------ | ------ |
`alpha` | number |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` randomGray

▸ **randomGray**(`alpha`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:665](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L665)*

**Parameters:**

Name | Type |
------ | ------ |
`alpha` | number |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [transformation](../modules/_bitmap_d_.bitmap.transformation.md) › [Colors](_bitmap_d_.bitmap.transformation.colors.md)

# Class: Colors

## Hierarchy

* **Colors**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.transformation.colors.md#constructor)

### Methods

* [blend](_bitmap_d_.bitmap.transformation.colors.md#blend)
* [filter](_bitmap_d_.bitmap.transformation.colors.md#filter)
* [grayScale](_bitmap_d_.bitmap.transformation.colors.md#grayscale)
* [sepia](_bitmap_d_.bitmap.transformation.colors.md#sepia)

## Constructors

###  constructor

\+ **new Colors**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[Colors](_bitmap_d_.bitmap.transformation.colors.md)*

*Defined in [bitmap.d.ts:975](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L975)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[Colors](_bitmap_d_.bitmap.transformation.colors.md)*

## Methods

###  blend

▸ **blend**(`o`: [ColorBlendOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorblendoptions)): *void*

*Defined in [bitmap.d.ts:977](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L977)*

**Parameters:**

Name | Type |
------ | ------ |
`o` | [ColorBlendOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorblendoptions) |

**Returns:** *void*

___

###  filter

▸ **filter**(`o`: [ColorFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorfilteroptions)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:981](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L981)*

Applies a linear transformation (a * value + c) on each channel (red, green, blue, alpha) .

**Parameters:**

Name | Type |
------ | ------ |
`o` | [ColorFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorfilteroptions) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  grayScale

▸ **grayScale**(`o`: [ColorFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorfilteroptions)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:985](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L985)*

transform each channel to the closer gray to each of them.

**Parameters:**

Name | Type |
------ | ------ |
`o` | [ColorFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#colorfilteroptions) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  sepia

▸ **sepia**(`o`: [SepiaFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#sepiafilteroptions)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:986](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L986)*

**Parameters:**

Name | Type |
------ | ------ |
`o` | [SepiaFilterOptions](../modules/_bitmap_d_.bitmap.transformation.md#sepiafilteroptions) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

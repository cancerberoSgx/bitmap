[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [transformation](../modules/_bitmap_d_.bitmap.transformation.md) › [Transform](_bitmap_d_.bitmap.transformation.transform.md)

# Class: Transform

## Hierarchy

* **Transform**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.transformation.transform.md#constructor)

### Methods

* [affine](_bitmap_d_.bitmap.transformation.transform.md#affine)
* [convolve](_bitmap_d_.bitmap.transformation.transform.md#convolve)
* [pixelize](_bitmap_d_.bitmap.transformation.transform.md#pixelize)

## Constructors

###  constructor

\+ **new Transform**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[Transform](_bitmap_d_.bitmap.transformation.transform.md)*

*Defined in [bitmap.d.ts:290](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L290)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[Transform](_bitmap_d_.bitmap.transformation.transform.md)*

## Methods

###  affine

▸ **affine**(`t`: [AffineOptions](../modules/_bitmap_d_.bitmap.transformation.md#affineoptions)): *object*

*Defined in [bitmap.d.ts:294](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L294)*

**Parameters:**

Name | Type |
------ | ------ |
`t` | [AffineOptions](../modules/_bitmap_d_.bitmap.transformation.md#affineoptions) |

**Returns:** *object*

___

###  convolve

▸ **convolve**(`t`: [ConvolveOptions](../modules/_bitmap_d_.bitmap.transformation.md#convolveoptions)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:293](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L293)*

**Parameters:**

Name | Type |
------ | ------ |
`t` | [ConvolveOptions](../modules/_bitmap_d_.bitmap.transformation.md#convolveoptions) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

___

###  pixelize

▸ **pixelize**(`t`: [PixelizeOptions](../modules/_bitmap_d_.bitmap.transformation.md#pixelizeoptions)): *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

*Defined in [bitmap.d.ts:292](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L292)*

**Parameters:**

Name | Type |
------ | ------ |
`t` | [PixelizeOptions](../modules/_bitmap_d_.bitmap.transformation.md#pixelizeoptions) |

**Returns:** *[Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)*

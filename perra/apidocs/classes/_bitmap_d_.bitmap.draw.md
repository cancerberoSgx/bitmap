[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [Draw](_bitmap_d_.bitmap.draw.md)

# Class: Draw

## Hierarchy

* **Draw**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.draw.md#constructor)

### Methods

* [line](_bitmap_d_.bitmap.draw.md#line)
* [rectangle](_bitmap_d_.bitmap.draw.md#rectangle)
* [rectangle2](_bitmap_d_.bitmap.draw.md#rectangle2)
* [set](_bitmap_d_.bitmap.draw.md#set)
* [triangle](_bitmap_d_.bitmap.draw.md#triangle)

## Constructors

###  constructor

\+ **new Draw**(`b`: [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md)): *[Draw](_bitmap_d_.bitmap.draw.md)*

*Defined in [bitmap.d.ts:712](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L712)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bitmap](../interfaces/_bitmap_d_.bitmap.bitmap.md) |

**Returns:** *[Draw](_bitmap_d_.bitmap.draw.md)*

## Methods

###  line

▸ **line**(`x1`: number, `y1`: number, `x2`: number, `y2`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend), `returnPoints?`: undefined | false | true): *[Point](../modules/_bitmap_d_.bitmap.md#point)[]*

*Defined in [bitmap.d.ts:717](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L717)*

adapted from http://www.brackeen.com/vga/source/djgpp20/lines.c.html

**Parameters:**

Name | Type |
------ | ------ |
`x1` | number |
`y1` | number |
`x2` | number |
`y2` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |
`returnPoints?` | undefined &#124; false &#124; true |

**Returns:** *[Point](../modules/_bitmap_d_.bitmap.md#point)[]*

___

###  rectangle

▸ **rectangle**(`r`: [RectangleShape](../modules/_bitmap_d_.bitmap.md#rectangleshape)): *void*

*Defined in [bitmap.d.ts:718](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L718)*

**Parameters:**

Name | Type |
------ | ------ |
`r` | [RectangleShape](../modules/_bitmap_d_.bitmap.md#rectangleshape) |

**Returns:** *void*

___

###  rectangle2

▸ **rectangle2**(`x`: number, `y`: number, `width`: number, `height`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `fill?`: undefined | false | true, `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend)): *void*

*Defined in [bitmap.d.ts:719](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L719)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`width` | number |
`height` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`fill?` | undefined &#124; false &#124; true |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |

**Returns:** *void*

___

###  set

▸ **set**(`x`: number, `y`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend)): *void*

*Defined in [bitmap.d.ts:721](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L721)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |

**Returns:** *void*

___

###  triangle

▸ **triangle**(`x1`: number, `y1`: number, `x2`: number, `y2`: number, `x3`: number, `y3`: number, `c`: [Color](../modules/_bitmap_d_.bitmap.md#color), `fill?`: undefined | false | true, `blend?`: [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend)): *void*

*Defined in [bitmap.d.ts:720](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L720)*

**Parameters:**

Name | Type |
------ | ------ |
`x1` | number |
`y1` | number |
`x2` | number |
`y2` | number |
`x3` | number |
`y3` | number |
`c` | [Color](../modules/_bitmap_d_.bitmap.md#color) |
`fill?` | undefined &#124; false &#124; true |
`blend?` | [ColorBlend](../modules/_bitmap_d_.bitmap.md#colorblend) |

**Returns:** *void*

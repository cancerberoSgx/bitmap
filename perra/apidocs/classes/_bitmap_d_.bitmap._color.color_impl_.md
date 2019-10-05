[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [_Color](../modules/_bitmap_d_.bitmap._color.md) › [Color_Impl_](_bitmap_d_.bitmap._color.color_impl_.md)

# Class: Color_Impl_

## Hierarchy

* **Color_Impl_**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap._color.color_impl_.md#protected-constructor)

### Methods

* [_new](_bitmap_d_.bitmap._color.color_impl_.md#static-_new)
* [create](_bitmap_d_.bitmap._color.color_impl_.md#static-create)
* [fromInt](_bitmap_d_.bitmap._color.color_impl_.md#static-fromint)
* [fromString](_bitmap_d_.bitmap._color.color_impl_.md#static-fromstring)
* [get_a](_bitmap_d_.bitmap._color.color_impl_.md#static-get_a)
* [get_b](_bitmap_d_.bitmap._color.color_impl_.md#static-get_b)
* [get_g](_bitmap_d_.bitmap._color.color_impl_.md#static-get_g)
* [get_r](_bitmap_d_.bitmap._color.color_impl_.md#static-get_r)
* [set_a](_bitmap_d_.bitmap._color.color_impl_.md#static-set_a)
* [set_b](_bitmap_d_.bitmap._color.color_impl_.md#static-set_b)
* [set_g](_bitmap_d_.bitmap._color.color_impl_.md#static-set_g)
* [set_r](_bitmap_d_.bitmap._color.color_impl_.md#static-set_r)
* [toString](_bitmap_d_.bitmap._color.color_impl_.md#static-tostring)

## Constructors

### `Protected` constructor

\+ **new Color_Impl_**(): *[Color_Impl_](_bitmap_d_.bitmap._color.color_impl_.md)*

*Defined in [bitmap.d.ts:576](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L576)*

**Returns:** *[Color_Impl_](_bitmap_d_.bitmap._color.color_impl_.md)*

## Methods

### `Static` _new

▸ **_new**(`rgba`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:594](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L594)*

Creates a new color.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`rgba` | number | The color value. It will be interpreted in RGBA8888 format.  |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` create

▸ **create**(`red`: number, `green`: number, `blue`: number, `alpha`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:603](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L603)*

Creates a new color.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`red` | number | The red component (0-255). |
`green` | number | The green component (0-255). |
`blue` | number | The blue component (0-255). |
`alpha` | number | The alpha component (0-255). |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

The new color value in RGBA8888 format.

___

### `Static` fromInt

▸ **fromInt**(`rgba`: number): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:610](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L610)*

Converts an integer to a RGBA8888 color.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`rgba` | number | The integer to convert to the color. |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

The RGBA color.

___

### `Static` fromString

▸ **fromString**(`s`: string): *[Color](../modules/_bitmap_d_.bitmap.md#color)*

*Defined in [bitmap.d.ts:604](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L604)*

**Parameters:**

Name | Type |
------ | ------ |
`s` | string |

**Returns:** *[Color](../modules/_bitmap_d_.bitmap.md#color)*

___

### `Static` get_a

▸ **get_a**(`this`: number): *number*

*Defined in [bitmap.d.ts:615](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L615)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |

**Returns:** *number*

___

### `Static` get_b

▸ **get_b**(`this`: number): *number*

*Defined in [bitmap.d.ts:614](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L614)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |

**Returns:** *number*

___

### `Static` get_g

▸ **get_g**(`this`: number): *number*

*Defined in [bitmap.d.ts:613](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L613)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |

**Returns:** *number*

___

### `Static` get_r

▸ **get_r**(`this`: number): *number*

*Defined in [bitmap.d.ts:612](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L612)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |

**Returns:** *number*

___

### `Static` set_a

▸ **set_a**(`this`: number, `value`: number): *number*

*Defined in [bitmap.d.ts:619](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L619)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |
`value` | number |

**Returns:** *number*

___

### `Static` set_b

▸ **set_b**(`this`: number, `value`: number): *number*

*Defined in [bitmap.d.ts:618](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L618)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |
`value` | number |

**Returns:** *number*

___

### `Static` set_g

▸ **set_g**(`this`: number, `value`: number): *number*

*Defined in [bitmap.d.ts:617](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L617)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |
`value` | number |

**Returns:** *number*

___

### `Static` set_r

▸ **set_r**(`this`: number, `value`: number): *number*

*Defined in [bitmap.d.ts:616](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L616)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |
`value` | number |

**Returns:** *number*

___

### `Static` toString

▸ **toString**(`this`: number): *string*

*Defined in [bitmap.d.ts:611](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L611)*

**Parameters:**

Name | Type |
------ | ------ |
`this` | number |

**Returns:** *string*

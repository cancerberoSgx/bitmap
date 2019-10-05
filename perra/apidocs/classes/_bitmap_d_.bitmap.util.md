[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [Util](_bitmap_d_.bitmap.util.md)

# Class: Util

Utility functions.
Adapted from https://github.com/Tw1ddle/geometrize-haxe/

## Hierarchy

* **Util**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.util.md#protected-constructor)

### Methods

* [abs](_bitmap_d_.bitmap.util.md#static-abs)
* [clamp](_bitmap_d_.bitmap.util.md#static-clamp)
* [dist](_bitmap_d_.bitmap.util.md#static-dist)
* [max](_bitmap_d_.bitmap.util.md#static-max)
* [min](_bitmap_d_.bitmap.util.md#static-min)
* [minMaxElements](_bitmap_d_.bitmap.util.md#static-minmaxelements)
* [multiply](_bitmap_d_.bitmap.util.md#static-multiply)
* [parseIntOrThrow](_bitmap_d_.bitmap.util.md#static-parseintorthrow)
* [printRectangle](_bitmap_d_.bitmap.util.md#static-printrectangle)
* [random](_bitmap_d_.bitmap.util.md#static-random)
* [randomArrayItem](_bitmap_d_.bitmap.util.md#static-randomarrayitem)
* [randomIntArray](_bitmap_d_.bitmap.util.md#static-randomintarray)
* [randomRectangle](_bitmap_d_.bitmap.util.md#static-randomrectangle)
* [sgn](_bitmap_d_.bitmap.util.md#static-sgn)
* [toDegrees](_bitmap_d_.bitmap.util.md#static-todegrees)
* [toRadians](_bitmap_d_.bitmap.util.md#static-toradians)
* [urlToBase64](_bitmap_d_.bitmap.util.md#static-urltobase64)

## Constructors

### `Protected` constructor

\+ **new Util**(): *[Util](_bitmap_d_.bitmap.util.md)*

*Defined in [bitmap.d.ts:829](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L829)*

**Returns:** *[Util](_bitmap_d_.bitmap.util.md)*

## Methods

### `Static` abs

▸ **abs**(`value`: number): *number*

*Defined in [bitmap.d.ts:859](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L859)*

Returns the absolute value of the given value.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`value` | number | The value to abs. |

**Returns:** *number*

The absolute value of the given value.

___

### `Static` clamp

▸ **clamp**(`value`: number, `min`: number, `max`: number): *number*

*Defined in [bitmap.d.ts:838](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L838)*

Clamps a value within a range.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`value` | number | The value to clamp. |
`min` | number | The lower bound of the range. |
`max` | number | The upper bound of the range. |

**Returns:** *number*

The clamped value.

___

### `Static` dist

▸ **dist**(`x`: number, `y`: number): *number*

*Defined in [bitmap.d.ts:895](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L895)*

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |
`y` | number |

**Returns:** *number*

___

### `Static` max

▸ **max**(`first`: number, `second`: number): *number*

*Defined in [bitmap.d.ts:853](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L853)*

Compare two values and returns the larger one.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`first` | number | The first value. |
`second` | number | The second value. |

**Returns:** *number*

The larger value.

___

### `Static` min

▸ **min**(`first`: number, `second`: number): *number*

*Defined in [bitmap.d.ts:846](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L846)*

Compares two values and returns the smaller one.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`first` | number | The first value. |
`second` | number | The second value. |

**Returns:** *number*

The smaller value.

___

### `Static` minMaxElements

▸ **minMaxElements**(`a`: number[]): *object*

*Defined in [bitmap.d.ts:908](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L908)*

Returns the smallest and largest items from an array of ints.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`a` | number[] | The array of ints. |

**Returns:** *object*

The smallest and largest items from the array.

___

### `Static` multiply

▸ **multiply**(`a`: number[][], `b`: number[][]): *number[][]*

*Defined in [bitmap.d.ts:894](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L894)*

**Parameters:**

Name | Type |
------ | ------ |
`a` | number[][] |
`b` | number[][] |

**Returns:** *number[][]*

___

### `Static` parseIntOrThrow

▸ **parseIntOrThrow**(`s`: string): *number*

*Defined in [bitmap.d.ts:878](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L878)*

Converts a value measured in radians to degrees.

**Parameters:**

Name | Type |
------ | ------ |
`s` | string |

**Returns:** *number*

The value converted to degrees.

___

### `Static` printRectangle

▸ **printRectangle**(`r`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *string*

*Defined in [bitmap.d.ts:839](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L839)*

**Parameters:**

Name | Type |
------ | ------ |
`r` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *string*

___

### `Static` random

▸ **random**(`lower`: number, `upper`: number): *number*

*Defined in [bitmap.d.ts:885](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L885)*

Returns a random integer in the range (inclusive).

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`lower` | number | The lower bound. |
`upper` | number | The upper bound. |

**Returns:** *number*

A random integer in the range [lower:upper] inclusive.

___

### `Static` randomArrayItem

▸ **randomArrayItem**<**T**>(`a`: T[]): *T*

*Defined in [bitmap.d.ts:902](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L902)*

Returns a random item from an array.

**Type parameters:**

▪ **T**

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`a` | T[] | The array to pick a random item from. |

**Returns:** *T*

A random item from the array.

___

### `Static` randomIntArray

▸ **randomIntArray**(`length`: number, `lower`: number, `upper`: number, `noRepeat?`: undefined | false | true): *number[]*

*Defined in [bitmap.d.ts:892](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L892)*

Returns a random array of integers in the range (inclusive).

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`length` | number | - |
`lower` | number | The lower bound. |
`upper` | number | The upper bound. |
`noRepeat?` | undefined &#124; false &#124; true | - |

**Returns:** *number[]*

An array of random integers in the range [lower:upper] inclusive.

___

### `Static` randomRectangle

▸ **randomRectangle**(`r`: [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle)): *object*

*Defined in [bitmap.d.ts:893](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L893)*

**Parameters:**

Name | Type |
------ | ------ |
`r` | [Rectangle](../modules/_bitmap_d_.bitmap.md#rectangle) |

**Returns:** *object*

___

### `Static` sgn

▸ **sgn**(`value`: number): *number*

*Defined in [bitmap.d.ts:860](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L860)*

**Parameters:**

Name | Type |
------ | ------ |
`value` | number |

**Returns:** *number*

___

### `Static` toDegrees

▸ **toDegrees**(`radians`: number): *number*

*Defined in [bitmap.d.ts:872](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L872)*

Converts a value measured in radians to degrees.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`radians` | number | Radians value to convert to degrees. |

**Returns:** *number*

The value converted to degrees.

___

### `Static` toRadians

▸ **toRadians**(`degrees`: number): *number*

*Defined in [bitmap.d.ts:866](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L866)*

Converts a value measured in degrees to radians.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`degrees` | number | Degrees value to convert to radians. |

**Returns:** *number*

The value converted to radians.

___

### `Static` urlToBase64

▸ **urlToBase64**(`s`: string): *string*

*Defined in [bitmap.d.ts:896](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L896)*

**Parameters:**

Name | Type |
------ | ------ |
`s` | string |

**Returns:** *string*

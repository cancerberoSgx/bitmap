[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [transformation](../modules/_bitmap_d_.bitmap.transformation.md) › [Affine](_bitmap_d_.bitmap.transformation.affine.md)

# Class: Affine

2D transformation matrix object initialized with identity matrix.

The matrix can synchronize a canvas context by supplying the context
as an argument, or later apply current absolute transform to an
existing context.

## Hierarchy

* **Affine**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.transformation.affine.md#constructor)

### Properties

* [a](_bitmap_d_.bitmap.transformation.affine.md#a)
* [b](_bitmap_d_.bitmap.transformation.affine.md#b)
* [c](_bitmap_d_.bitmap.transformation.affine.md#c)
* [d](_bitmap_d_.bitmap.transformation.affine.md#d)
* [e](_bitmap_d_.bitmap.transformation.affine.md#e)
* [f](_bitmap_d_.bitmap.transformation.affine.md#f)

### Methods

* [applyToArray](_bitmap_d_.bitmap.transformation.affine.md#applytoarray)
* [applyToPoint](_bitmap_d_.bitmap.transformation.affine.md#applytopoint)
* [applyToPoints](_bitmap_d_.bitmap.transformation.affine.md#applytopoints)
* [assign](_bitmap_d_.bitmap.transformation.affine.md#assign)
* [flipX](_bitmap_d_.bitmap.transformation.affine.md#flipx)
* [flipY](_bitmap_d_.bitmap.transformation.affine.md#flipy)
* [getMatrix](_bitmap_d_.bitmap.transformation.affine.md#getmatrix)
* [interpolate](_bitmap_d_.bitmap.transformation.affine.md#interpolate)
* [isIdentity](_bitmap_d_.bitmap.transformation.affine.md#isidentity)
* [rotate](_bitmap_d_.bitmap.transformation.affine.md#rotate)
* [rotateDeg](_bitmap_d_.bitmap.transformation.affine.md#rotatedeg)
* [scale](_bitmap_d_.bitmap.transformation.affine.md#scale)
* [scaleX](_bitmap_d_.bitmap.transformation.affine.md#scalex)
* [scaleY](_bitmap_d_.bitmap.transformation.affine.md#scaley)
* [skew](_bitmap_d_.bitmap.transformation.affine.md#skew)
* [skewX](_bitmap_d_.bitmap.transformation.affine.md#skewx)
* [skewY](_bitmap_d_.bitmap.transformation.affine.md#skewy)
* [transform](_bitmap_d_.bitmap.transformation.affine.md#transform)
* [transformMatrix](_bitmap_d_.bitmap.transformation.affine.md#transformmatrix)
* [translate](_bitmap_d_.bitmap.transformation.affine.md#translate)
* [translateX](_bitmap_d_.bitmap.transformation.affine.md#translatex)
* [translateY](_bitmap_d_.bitmap.transformation.affine.md#translatey)
* [identity](_bitmap_d_.bitmap.transformation.affine.md#static-identity)

## Constructors

###  constructor

\+ **new Affine**(): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:116](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L116)*

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

## Properties

###  a

• **a**: *number*

*Defined in [bitmap.d.ts:121](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L121)*

scale x

___

###  b

• **b**: *number*

*Defined in [bitmap.d.ts:125](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L125)*

skew y

___

###  c

• **c**: *number*

*Defined in [bitmap.d.ts:129](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L129)*

skew x

___

###  d

• **d**: *number*

*Defined in [bitmap.d.ts:133](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L133)*

scale y

___

###  e

• **e**: *number*

*Defined in [bitmap.d.ts:137](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L137)*

translate x

___

###  f

• **f**: *number*

*Defined in [bitmap.d.ts:141](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L141)*

translate y

## Methods

###  applyToArray

▸ **applyToArray**(`points`: Int32Array): *Int32Array*

*Defined in [bitmap.d.ts:272](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L272)*

Apply current matrix to a typed array with point pairs. Although
the input array may be an ordinary array, this method is intended
for more performant use where typed arrays are used. The returned
array is regardless always returned as a UInt16Array.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`points` | Int32Array | array with point pairs |

**Returns:** *Int32Array*

A new array with transformed points

___

###  applyToPoint

▸ **applyToPoint**(`x`: number, `y`: number): *object*

*Defined in [bitmap.d.ts:150](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L150)*

Apply current matrix to x and y point.
Returns a point object.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`x` | number | value for x |
`y` | number | value for y |

**Returns:** *object*

A new transformed point object

___

###  applyToPoints

▸ **applyToPoints**(`points`: [FloatPoint](../modules/_bitmap_d_.bitmap.md#floatpoint)[]): *[FloatPoint](../modules/_bitmap_d_.bitmap.md#floatpoint)[]*

*Defined in [bitmap.d.ts:262](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L262)*

Apply current matrix to array with point objects or point pairs.
Returns a new array with points in the same format as the input array.

A point object is an object literal:

{x: x, y: y}

so an array would contain either:

[{x: x1, y: y1} {x: x2, y: y2} ... {x: xn, y: yn}]

or
[x1, y1, x2, y2, ... xn, yn]

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`points` | [FloatPoint](../modules/_bitmap_d_.bitmap.md#floatpoint)[] | array with point objects or pairs |

**Returns:** *[FloatPoint](../modules/_bitmap_d_.bitmap.md#floatpoint)[]*

A new array with transformed points

___

###  assign

▸ **assign**(`m`: [AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix)): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:159](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L159)*

Assign this affine to given matrix.

**Parameters:**

Name | Type |
------ | ------ |
`m` | [AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix) |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  flipX

▸ **flipX**(): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:211](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L211)*

Flips the horizontal values.

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  flipY

▸ **flipY**(): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:207](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L207)*

Flips the vertical values.

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  getMatrix

▸ **getMatrix**(): *object*

*Defined in [bitmap.d.ts:160](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L160)*

**Returns:** *object*

___

###  interpolate

▸ **interpolate**(`m2`: [AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix), `t`: number): *[AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix)*

*Defined in [bitmap.d.ts:177](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L177)*

Interpolate this matrix with another and produce a new matrix.
t is a value in the range [0.0, 1.0] where 0 is this instance and
1 is equal to the second matrix. The t value is not constrained.

Context from parent matrix is not applied to the returned matrix.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`m2` | [AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix) | the matrix to interpolate with. |
`t` | number | interpolation [0.0, 1.0] |

**Returns:** *[AffineMatrix](../modules/_bitmap_d_.bitmap.transformation.md#affinematrix)*

- new instance with the interpolated result

___

###  isIdentity

▸ **isIdentity**(): *boolean*

*Defined in [bitmap.d.ts:165](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L165)*

Returns true if matrix is an identity matrix (no transforms applied).

**Returns:** *boolean*

True if identity (not transformed)

___

###  rotate

▸ **rotate**(`angle`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:182](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L182)*

Rotates current matrix accumulative by angle.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`angle` | number | angle in radians  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  rotateDeg

▸ **rotateDeg**(`angle`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:187](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L187)*

Helper method to make a rotation based on an angle in degrees.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`angle` | number | angle in degrees  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  scale

▸ **scale**(`sx`: number, `sy`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:217](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L217)*

Scales current matrix accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sx` | number | scale factor x (1 does nothing) |
`sy` | number | scale factor y (1 does nothing)  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  scaleX

▸ **scaleX**(`sx`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:222](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L222)*

Scales current matrix on x axis accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sx` | number | scale factor x (1 does nothing)  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  scaleY

▸ **scaleY**(`sy`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:227](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L227)*

Scales current matrix on y axis accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sy` | number | scale factor y (1 does nothing)  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  skew

▸ **skew**(`sx`: number, `sy`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:233](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L233)*

Apply skew to the current matrix accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sx` | number | amount of skew for x |
`sy` | number | amount of skew for y  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  skewX

▸ **skewX**(`sx`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:238](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L238)*

Apply skew for x to the current matrix accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sx` | number | amount of skew for x  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  skewY

▸ **skewY**(`sy`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:243](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L243)*

Apply skew for y to the current matrix accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`sy` | number | amount of skew for y  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  transform

▸ **transform**(`o`: [AffineOptions](../modules/_bitmap_d_.bitmap.transformation.md#affineoptions)): *object*

*Defined in [bitmap.d.ts:151](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L151)*

**Parameters:**

Name | Type |
------ | ------ |
`o` | [AffineOptions](../modules/_bitmap_d_.bitmap.transformation.md#affineoptions) |

**Returns:** *object*

___

###  transformMatrix

▸ **transformMatrix**(`a2`: number, `b2`: number, `c2`: number, `d2`: number, `e2`: number, `f2`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:155](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L155)*

Multiplies current matrix with new matrix values.

**Parameters:**

Name | Type |
------ | ------ |
`a2` | number |
`b2` | number |
`c2` | number |
`d2` | number |
`e2` | number |
`f2` | number |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  translate

▸ **translate**(`tx`: number, `ty`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:193](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L193)*

Translate current matrix accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`tx` | number | translation for x |
`ty` | number | translation for y  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  translateX

▸ **translateX**(`tx`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:198](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L198)*

Translate current matrix on x axis accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`tx` | number | translation for x  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

###  translateY

▸ **translateY**(`ty`: number): *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

*Defined in [bitmap.d.ts:203](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L203)*

Translate current matrix on y axis accumulative.

**Parameters:**

Name | Type | Description |
------ | ------ | ------ |
`ty` | number | translation for y  |

**Returns:** *[Affine](_bitmap_d_.bitmap.transformation.affine.md)*

___

### `Static` identity

▸ **identity**(): *object*

*Defined in [bitmap.d.ts:273](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L273)*

**Returns:** *object*

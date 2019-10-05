[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [haxe](../modules/_bitmap_d_.haxe.md) › [io](../modules/_bitmap_d_.haxe.io.md) › [Bytes](_bitmap_d_.haxe.io.bytes.md)

# Class: Bytes

## Hierarchy

* **Bytes**

## Index

### Constructors

* [constructor](_bitmap_d_.haxe.io.bytes.md#protected-constructor)

### Properties

* [length](_bitmap_d_.haxe.io.bytes.md#length)

### Methods

* [blit](_bitmap_d_.haxe.io.bytes.md#blit)
* [compare](_bitmap_d_.haxe.io.bytes.md#compare)
* [fill](_bitmap_d_.haxe.io.bytes.md#fill)
* [getInt32](_bitmap_d_.haxe.io.bytes.md#getint32)
* [getString](_bitmap_d_.haxe.io.bytes.md#getstring)
* [setInt32](_bitmap_d_.haxe.io.bytes.md#setint32)
* [sub](_bitmap_d_.haxe.io.bytes.md#sub)
* [toString](_bitmap_d_.haxe.io.bytes.md#tostring)
* [ofData](_bitmap_d_.haxe.io.bytes.md#static-ofdata)
* [ofString](_bitmap_d_.haxe.io.bytes.md#static-ofstring)

## Constructors

### `Protected` constructor

\+ **new Bytes**(`data`: ArrayBuffer): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:18](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L18)*

**Parameters:**

Name | Type |
------ | ------ |
`data` | ArrayBuffer |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

## Properties

###  length

• **length**: *number*

*Defined in [bitmap.d.ts:20](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L20)*

## Methods

###  blit

▸ **blit**(`pos`: number, `src`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `srcpos`: number, `len`: number): *void*

*Defined in [bitmap.d.ts:21](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L21)*

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |
`src` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`srcpos` | number |
`len` | number |

**Returns:** *void*

___

###  compare

▸ **compare**(`other`: [Bytes](_bitmap_d_.haxe.io.bytes.md)): *number*

*Defined in [bitmap.d.ts:24](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L24)*

**Parameters:**

Name | Type |
------ | ------ |
`other` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |

**Returns:** *number*

___

###  fill

▸ **fill**(`pos`: number, `len`: number, `value`: number): *void*

*Defined in [bitmap.d.ts:22](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L22)*

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |
`len` | number |
`value` | number |

**Returns:** *void*

___

###  getInt32

▸ **getInt32**(`pos`: number): *number*

*Defined in [bitmap.d.ts:28](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L28)*

Returns the 32 bit integer at given position (in low endian encoding).

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |

**Returns:** *number*

___

###  getString

▸ **getString**(`pos`: number, `len`: number, `encoding?`: any): *string*

*Defined in [bitmap.d.ts:33](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L33)*

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |
`len` | number |
`encoding?` | any |

**Returns:** *string*

___

###  setInt32

▸ **setInt32**(`pos`: number, `v`: number): *void*

*Defined in [bitmap.d.ts:32](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L32)*

Store the 32 bit integer at given position (in low endian encoding).

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |
`v` | number |

**Returns:** *void*

___

###  sub

▸ **sub**(`pos`: number, `len`: number): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:23](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L23)*

**Parameters:**

Name | Type |
------ | ------ |
`pos` | number |
`len` | number |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

___

###  toString

▸ **toString**(): *string*

*Defined in [bitmap.d.ts:37](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L37)*

Returns string representation of the bytes as UTF8

**Returns:** *string*

___

### `Static` ofData

▸ **ofData**(`b`: ArrayBuffer): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:42](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L42)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | ArrayBuffer |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

___

### `Static` ofString

▸ **ofString**(`s`: string, `encoding?`: any): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:41](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L41)*

Returns bytes representation of the given String, using specific encoding (UTF-8 by default)

**Parameters:**

Name | Type |
------ | ------ |
`s` | string |
`encoding?` | any |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

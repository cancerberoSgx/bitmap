[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [haxe](../modules/_bitmap_d_.haxe.md) › [io](../modules/_bitmap_d_.haxe.io.md) › [Output](_bitmap_d_.haxe.io.output.md)

# Class: Output

An Output is an abstract write. A specific output implementation will only
have to override the `writeByte` and maybe the `write`, `flush` and `close`
methods. See `File.write` and `String.write` for two ways of creating an
Output.

## Hierarchy

* **Output**

## Index

### Constructors

* [constructor](_bitmap_d_.haxe.io.output.md#protected-constructor)

### Properties

* [bigEndian](_bitmap_d_.haxe.io.output.md#bigendian)

### Methods

* [set_bigEndian](_bitmap_d_.haxe.io.output.md#set_bigendian)
* [write](_bitmap_d_.haxe.io.output.md#write)
* [writeByte](_bitmap_d_.haxe.io.output.md#writebyte)
* [writeBytes](_bitmap_d_.haxe.io.output.md#writebytes)
* [writeFullBytes](_bitmap_d_.haxe.io.output.md#writefullbytes)
* [writeInt32](_bitmap_d_.haxe.io.output.md#writeint32)
* [writeString](_bitmap_d_.haxe.io.output.md#writestring)

## Constructors

### `Protected` constructor

\+ **new Output**(): *[Output](_bitmap_d_.haxe.io.output.md)*

*Defined in [bitmap.d.ts:362](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L362)*

**Returns:** *[Output](_bitmap_d_.haxe.io.output.md)*

## Properties

###  bigEndian

• **bigEndian**: *boolean*

*Defined in [bitmap.d.ts:368](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L368)*

Endianness (word byte order) used when writing numbers.
If `true`, big-endian is used, otherwise `little-endian` is used.

## Methods

###  set_bigEndian

▸ **set_bigEndian**(`b`: boolean): *boolean*

*Defined in [bitmap.d.ts:379](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L379)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | boolean |

**Returns:** *boolean*

___

###  write

▸ **write**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md)): *void*

*Defined in [bitmap.d.ts:383](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L383)*

Write all bytes stored in `s`.

**Parameters:**

Name | Type |
------ | ------ |
`s` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |

**Returns:** *void*

___

###  writeByte

▸ **writeByte**(`c`: number): *void*

*Defined in [bitmap.d.ts:372](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L372)*

Write one byte.

**Parameters:**

Name | Type |
------ | ------ |
`c` | number |

**Returns:** *void*

___

###  writeBytes

▸ **writeBytes**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *number*

*Defined in [bitmap.d.ts:378](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L378)*

Write `len` bytes from `s` starting by position specified by `pos`.
Returns the actual length of written data that can differ from `len`.
See `writeFullBytes` that tries to write the exact amount of specified bytes.

**Parameters:**

Name | Type |
------ | ------ |
`s` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos` | number |
`len` | number |

**Returns:** *number*

___

###  writeFullBytes

▸ **writeFullBytes**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *void*

*Defined in [bitmap.d.ts:388](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L388)*

Write `len` bytes from `s` starting by position specified by `pos`.
Unlike `writeBytes`, this method tries to write the exact `len` amount of bytes.

**Parameters:**

Name | Type |
------ | ------ |
`s` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos` | number |
`len` | number |

**Returns:** *void*

___

###  writeInt32

▸ **writeInt32**(`x`: number): *void*

*Defined in [bitmap.d.ts:393](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L393)*

Write `x` as 32-bit signed integer.
Endianness is specified by the `bigEndian` property.

**Parameters:**

Name | Type |
------ | ------ |
`x` | number |

**Returns:** *void*

___

###  writeString

▸ **writeString**(`s`: string, `encoding?`: any): *void*

*Defined in [bitmap.d.ts:397](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L397)*

Write `s` string.

**Parameters:**

Name | Type |
------ | ------ |
`s` | string |
`encoding?` | any |

**Returns:** *void*

[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [haxe](../modules/_bitmap_d_.haxe.md) › [io](../modules/_bitmap_d_.haxe.io.md) › [Input](_bitmap_d_.haxe.io.input.md)

# Class: Input

An Input is an abstract reader. See other classes in the `haxe.io` package
for several possible implementations.
All functions which read data throw `Eof` when the end of the stream
is reached.

## Hierarchy

* **Input**

  ↳ [BytesInput](_bitmap_d_.haxe.io.bytesinput.md)

## Index

### Constructors

* [constructor](_bitmap_d_.haxe.io.input.md#protected-constructor)

### Properties

* [bigEndian](_bitmap_d_.haxe.io.input.md#bigendian)

### Methods

* [read](_bitmap_d_.haxe.io.input.md#read)
* [readAll](_bitmap_d_.haxe.io.input.md#readall)
* [readByte](_bitmap_d_.haxe.io.input.md#readbyte)
* [readBytes](_bitmap_d_.haxe.io.input.md#readbytes)
* [readFullBytes](_bitmap_d_.haxe.io.input.md#readfullbytes)
* [readInt32](_bitmap_d_.haxe.io.input.md#readint32)
* [readString](_bitmap_d_.haxe.io.input.md#readstring)
* [readUInt16](_bitmap_d_.haxe.io.input.md#readuint16)
* [set_bigEndian](_bitmap_d_.haxe.io.input.md#set_bigendian)

## Constructors

### `Protected` constructor

\+ **new Input**(): *[Input](_bitmap_d_.haxe.io.input.md)*

*Defined in [bitmap.d.ts:305](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L305)*

**Returns:** *[Input](_bitmap_d_.haxe.io.input.md)*

## Properties

###  bigEndian

• **bigEndian**: *boolean*

*Defined in [bitmap.d.ts:311](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L311)*

Endianness (word byte order) used when reading numbers.
If `true`, big-endian is used, otherwise `little-endian` is used.

## Methods

###  read

▸ **read**(`nbytes`: number): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:337](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L337)*

Read and return `nbytes` bytes.

**Parameters:**

Name | Type |
------ | ------ |
`nbytes` | number |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

___

###  readAll

▸ **readAll**(`bufsize`: number): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Defined in [bitmap.d.ts:328](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L328)*

Read and return all available data.
The `bufsize` optional argument specifies the size of chunks by
which data is read. Its default value is target-specific.

**Parameters:**

Name | Type |
------ | ------ |
`bufsize` | number |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

___

###  readByte

▸ **readByte**(): *number*

*Defined in [bitmap.d.ts:315](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L315)*

Read and return one byte.

**Returns:** *number*

___

###  readBytes

▸ **readBytes**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *number*

*Defined in [bitmap.d.ts:321](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L321)*

Read `len` bytes and write them into `s` to the position specified by `pos`.
Returns the actual length of read data that can be smaller than `len`.
See `readFullBytes` that tries to read the exact amount of specified bytes.

**Parameters:**

Name | Type |
------ | ------ |
`s` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos` | number |
`len` | number |

**Returns:** *number*

___

###  readFullBytes

▸ **readFullBytes**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *void*

*Defined in [bitmap.d.ts:333](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L333)*

Read `len` bytes and write them into `s` to the position specified by `pos`.
Unlike `readBytes`, this method tries to read the exact `len` amount of bytes.

**Parameters:**

Name | Type |
------ | ------ |
`s` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos` | number |
`len` | number |

**Returns:** *void*

___

###  readInt32

▸ **readInt32**(): *number*

*Defined in [bitmap.d.ts:347](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L347)*

Read a 32-bit signed integer.
Endianness is specified by the `bigEndian` property.

**Returns:** *number*

___

###  readString

▸ **readString**(`len`: number, `encoding?`: any): *string*

*Defined in [bitmap.d.ts:351](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L351)*

Read and `len` bytes as a string.

**Parameters:**

Name | Type |
------ | ------ |
`len` | number |
`encoding?` | any |

**Returns:** *string*

___

###  readUInt16

▸ **readUInt16**(): *number*

*Defined in [bitmap.d.ts:342](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L342)*

Read a 16-bit unsigned integer.
Endianness is specified by the `bigEndian` property.

**Returns:** *number*

___

###  set_bigEndian

▸ **set_bigEndian**(`b`: boolean): *boolean*

*Defined in [bitmap.d.ts:322](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L322)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | boolean |

**Returns:** *boolean*

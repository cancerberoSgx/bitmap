[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [haxe](../modules/_bitmap_d_.haxe.md) › [io](../modules/_bitmap_d_.haxe.io.md) › [BytesInput](_bitmap_d_.haxe.io.bytesinput.md)

# Class: BytesInput

## Hierarchy

* [Input](_bitmap_d_.haxe.io.input.md)

  ↳ **BytesInput**

## Index

### Constructors

* [constructor](_bitmap_d_.haxe.io.bytesinput.md#constructor)

### Properties

* [bigEndian](_bitmap_d_.haxe.io.bytesinput.md#bigendian)
* [length](_bitmap_d_.haxe.io.bytesinput.md#length)
* [position](_bitmap_d_.haxe.io.bytesinput.md#position)

### Methods

* [read](_bitmap_d_.haxe.io.bytesinput.md#read)
* [readAll](_bitmap_d_.haxe.io.bytesinput.md#readall)
* [readByte](_bitmap_d_.haxe.io.bytesinput.md#readbyte)
* [readBytes](_bitmap_d_.haxe.io.bytesinput.md#readbytes)
* [readFullBytes](_bitmap_d_.haxe.io.bytesinput.md#readfullbytes)
* [readInt32](_bitmap_d_.haxe.io.bytesinput.md#readint32)
* [readString](_bitmap_d_.haxe.io.bytesinput.md#readstring)
* [readUInt16](_bitmap_d_.haxe.io.bytesinput.md#readuint16)
* [set_bigEndian](_bitmap_d_.haxe.io.bytesinput.md#set_bigendian)

## Constructors

###  constructor

\+ **new BytesInput**(`b`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos?`: undefined | number, `len?`: undefined | number): *[BytesInput](_bitmap_d_.haxe.io.bytesinput.md)*

*Overrides [Input](_bitmap_d_.haxe.io.input.md).[constructor](_bitmap_d_.haxe.io.input.md#protected-constructor)*

*Defined in [bitmap.d.ts:734](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L734)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos?` | undefined &#124; number |
`len?` | undefined &#124; number |

**Returns:** *[BytesInput](_bitmap_d_.haxe.io.bytesinput.md)*

## Properties

###  bigEndian

• **bigEndian**: *boolean*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[bigEndian](_bitmap_d_.haxe.io.input.md#bigendian)*

*Defined in [bitmap.d.ts:311](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L311)*

Endianness (word byte order) used when reading numbers.
If `true`, big-endian is used, otherwise `little-endian` is used.

___

###  length

• **length**: *number*

*Defined in [bitmap.d.ts:743](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L743)*

The length of the stream in bytes.

___

###  position

• **position**: *number*

*Defined in [bitmap.d.ts:739](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L739)*

The current position in the stream in bytes.

## Methods

###  read

▸ **read**(`nbytes`: number): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[read](_bitmap_d_.haxe.io.input.md#read)*

*Defined in [bitmap.d.ts:337](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L337)*

Read and return `nbytes` bytes.

**Parameters:**

Name | Type |
------ | ------ |
`nbytes` | number |

**Returns:** *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

___

###  readAll

▸ **readAll**(`bufsize`: number): *[Bytes](_bitmap_d_.haxe.io.bytes.md)*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[readAll](_bitmap_d_.haxe.io.input.md#readall)*

*Defined in [bitmap.d.ts:328](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L328)*

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

*Overrides [Input](_bitmap_d_.haxe.io.input.md).[readByte](_bitmap_d_.haxe.io.input.md#readbyte)*

*Defined in [bitmap.d.ts:744](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L744)*

**Returns:** *number*

___

###  readBytes

▸ **readBytes**(`buf`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *number*

*Overrides [Input](_bitmap_d_.haxe.io.input.md).[readBytes](_bitmap_d_.haxe.io.input.md#readbytes)*

*Defined in [bitmap.d.ts:745](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L745)*

**Parameters:**

Name | Type |
------ | ------ |
`buf` | [Bytes](_bitmap_d_.haxe.io.bytes.md) |
`pos` | number |
`len` | number |

**Returns:** *number*

___

###  readFullBytes

▸ **readFullBytes**(`s`: [Bytes](_bitmap_d_.haxe.io.bytes.md), `pos`: number, `len`: number): *void*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[readFullBytes](_bitmap_d_.haxe.io.input.md#readfullbytes)*

*Defined in [bitmap.d.ts:333](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L333)*

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

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[readInt32](_bitmap_d_.haxe.io.input.md#readint32)*

*Defined in [bitmap.d.ts:347](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L347)*

Read a 32-bit signed integer.
Endianness is specified by the `bigEndian` property.

**Returns:** *number*

___

###  readString

▸ **readString**(`len`: number, `encoding?`: any): *string*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[readString](_bitmap_d_.haxe.io.input.md#readstring)*

*Defined in [bitmap.d.ts:351](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L351)*

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

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[readUInt16](_bitmap_d_.haxe.io.input.md#readuint16)*

*Defined in [bitmap.d.ts:342](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L342)*

Read a 16-bit unsigned integer.
Endianness is specified by the `bigEndian` property.

**Returns:** *number*

___

###  set_bigEndian

▸ **set_bigEndian**(`b`: boolean): *boolean*

*Inherited from [Input](_bitmap_d_.haxe.io.input.md).[set_bigEndian](_bitmap_d_.haxe.io.input.md#set_bigendian)*

*Defined in [bitmap.d.ts:322](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L322)*

**Parameters:**

Name | Type |
------ | ------ |
`b` | boolean |

**Returns:** *boolean*

[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [support](../modules/_bitmap_d_.bitmap.support.md) › [Promise](_bitmap_d_.bitmap.support.promise.md)

# Class: Promise <**T**>

## Type parameters

▪ **T**

## Hierarchy

* **Promise**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.support.promise.md#constructor)

### Methods

* [then](_bitmap_d_.bitmap.support.promise.md#then)
* [all](_bitmap_d_.bitmap.support.promise.md#static-all)
* [resolve](_bitmap_d_.bitmap.support.promise.md#static-resolve)

## Constructors

###  constructor

\+ **new Promise**(`fn`: function): *[Promise](_bitmap_d_.bitmap.support.promise.md)*

*Defined in [bitmap.d.ts:506](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L506)*

**Parameters:**

▪ **fn**: *function*

▸ (`resolve`: function): *void*

**Parameters:**

▪ **resolve**: *function*

▸ (`t`: T): *void*

**Parameters:**

Name | Type |
------ | ------ |
`t` | T |

**Returns:** *[Promise](_bitmap_d_.bitmap.support.promise.md)*

## Methods

###  then

▸ **then**(`l`: function): *void*

*Defined in [bitmap.d.ts:508](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L508)*

**Parameters:**

▪ **l**: *function*

▸ (`t`: T): *void*

**Parameters:**

Name | Type |
------ | ------ |
`t` | T |

**Returns:** *void*

___

### `Static` all

▸ **all**<**T**>(`promises`: [Promise](_bitmap_d_.bitmap.support.promise.md)‹T›[]): *[Promise](_bitmap_d_.bitmap.support.promise.md)‹T[]›*

*Defined in [bitmap.d.ts:509](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L509)*

**Type parameters:**

▪ **T**

**Parameters:**

Name | Type |
------ | ------ |
`promises` | [Promise](_bitmap_d_.bitmap.support.promise.md)‹T›[] |

**Returns:** *[Promise](_bitmap_d_.bitmap.support.promise.md)‹T[]›*

___

### `Static` resolve

▸ **resolve**<**T**>(`t`: T): *[Promise](_bitmap_d_.bitmap.support.promise.md)‹T›*

*Defined in [bitmap.d.ts:510](https://github.com/cancerberoSgx/bitmap/blob/201d0f4/perra/src/bitmap.d.ts#L510)*

**Type parameters:**

▪ **T**

**Parameters:**

Name | Type |
------ | ------ |
`t` | T |

**Returns:** *[Promise](_bitmap_d_.bitmap.support.promise.md)‹T›*

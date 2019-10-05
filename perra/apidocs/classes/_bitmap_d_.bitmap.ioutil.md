[perra](../README.md) › ["bitmap.d"](../modules/_bitmap_d_.md) › [bitmap](../modules/_bitmap_d_.bitmap.md) › [IOUtil](_bitmap_d_.bitmap.ioutil.md)

# Class: IOUtil

## Hierarchy

* **IOUtil**

## Index

### Constructors

* [constructor](_bitmap_d_.bitmap.ioutil.md#protected-constructor)

### Methods

* [args](_bitmap_d_.bitmap.ioutil.md#static-args)
* [exit](_bitmap_d_.bitmap.ioutil.md#static-exit)
* [fetch](_bitmap_d_.bitmap.ioutil.md#static-fetch)
* [fetchResource](_bitmap_d_.bitmap.ioutil.md#static-fetchresource)
* [readFile](_bitmap_d_.bitmap.ioutil.md#static-readfile)
* [readTextFile](_bitmap_d_.bitmap.ioutil.md#static-readtextfile)
* [writeFile](_bitmap_d_.bitmap.ioutil.md#static-writefile)
* [writeTextFile](_bitmap_d_.bitmap.ioutil.md#static-writetextfile)

## Constructors

### `Protected` constructor

\+ **new IOUtil**(): *[IOUtil](_bitmap_d_.bitmap.ioutil.md)*

*Defined in [bitmap.d.ts:757](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L757)*

**Returns:** *[IOUtil](_bitmap_d_.bitmap.ioutil.md)*

## Methods

### `Static` args

▸ **args**(): *string[]*

*Defined in [bitmap.d.ts:762](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L762)*

**Returns:** *string[]*

___

### `Static` exit

▸ **exit**(`code`: number): *any*

*Defined in [bitmap.d.ts:763](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L763)*

**Parameters:**

Name | Type |
------ | ------ |
`code` | number |

**Returns:** *any*

___

### `Static` fetch

▸ **fetch**(`url`: string, `cb?`: undefined | function): *[Promise](_bitmap_d_.bitmap.support.promise.md)‹[FetchResult](../modules/_bitmap_d_.bitmap.md#fetchresult)›*

*Defined in [bitmap.d.ts:759](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L759)*

**Parameters:**

Name | Type |
------ | ------ |
`url` | string |
`cb?` | undefined &#124; function |

**Returns:** *[Promise](_bitmap_d_.bitmap.support.promise.md)‹[FetchResult](../modules/_bitmap_d_.bitmap.md#fetchresult)›*

___

### `Static` fetchResource

▸ **fetchResource**(`url`: string, `cb`: function): *void*

*Defined in [bitmap.d.ts:760](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L760)*

**Parameters:**

▪ **url**: *string*

▪ **cb**: *function*

▸ (`error`: any, `data`: ArrayBuffer): *void*

**Parameters:**

Name | Type |
------ | ------ |
`error` | any |
`data` | ArrayBuffer |

**Returns:** *void*

___

### `Static` readFile

▸ **readFile**(`path`: string): *[Input](_bitmap_d_.haxe.io.input.md)*

*Defined in [bitmap.d.ts:761](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L761)*

**Parameters:**

Name | Type |
------ | ------ |
`path` | string |

**Returns:** *[Input](_bitmap_d_.haxe.io.input.md)*

___

### `Static` readTextFile

▸ **readTextFile**(`path`: string): *string*

*Defined in [bitmap.d.ts:764](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L764)*

**Parameters:**

Name | Type |
------ | ------ |
`path` | string |

**Returns:** *string*

___

### `Static` writeFile

▸ **writeFile**(`file`: string, `input`: [Input](_bitmap_d_.haxe.io.input.md)): *void*

*Defined in [bitmap.d.ts:765](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L765)*

**Parameters:**

Name | Type |
------ | ------ |
`file` | string |
`input` | [Input](_bitmap_d_.haxe.io.input.md) |

**Returns:** *void*

___

### `Static` writeTextFile

▸ **writeTextFile**(`path`: string, `s`: string): *void*

*Defined in [bitmap.d.ts:766](https://github.com/cancerberoSgx/bitmap/blob/a4d7607/perra/src/bitmap.d.ts#L766)*

**Parameters:**

Name | Type |
------ | ------ |
`path` | string |
`s` | string |

**Returns:** *void*

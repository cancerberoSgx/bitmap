## TODO

- [ ] browser example. load png from url, draw/transform and render it back again as img.
- [ ] fix haxe cookbook "macro combine structures" to support haxe 4 (Use ObjectField)
- [ ] check https://github.com/martamius/Exif.hx and see if with format.jpg read/write jpg could be supported
- [ ] export the library to other target's library by @:exposing public API( so non haxe users can also use it)
- [ ] dox
- [ ] bitmap.util.resize() - it will resize the bitmap itself - not like affine
- [ ] bitmap.util.scale() - both a bitmap resize and affine resize
- [ ] color transformations: bright, contrast, replace-color
- [ ] bitmap.util.write(bitmap2, x, y, blend)
- [ ] bitmap.util.compare():number - move equals to bitmap.util
- [ ] code formatter
- [ ] easy API for common affine transforms like rotate, translate, skew
- [ ] easy API for common convolutions like blur, sharpen, edges, etc
- [ ] remove the borders of convolution result by copying neighbor
- [ ] transformations modify not respected
- [ ] bitmap.copy(bounds?:Rectangle):Bitmap
- [ ] bitmap.view(bounds?:Rectangle):Bitmap // returns a new Bitmap but using the same data so modifications will affect both
- [ ] refactor Affine: AffineTransform will have the transform() method for Transform, and Affine can be instantiated by user, transformed/multiplied/interpolate and passed as option. remove Matrix and define a,b,c,... as Affine props.
- [ ] browser test n(sh test.sh should verify that at least the browser example renders whet it should,)
- [ ] bitmap.setOffset(bounds):Bitmap : offset support for bitmap: width, height, set, get methods in coordinates relative to `offset` property. Use case, work only on a region of the bitmap. Multiple bitmap referencing the same data
- [ ] iterate faster with UInt32Array http://jsfiddle.net/cancerbero_sgx/h824Lq0n/4/
- [x] in32 and in8 configurable modes for get/set
- [x] affine issues : lots doesn't work like rotate, flipY. The ones using negative values...
- [x] ensure that Bitmaps never throw error when drawing outside their canvas if noRangeCheck=true
- [x] affine transformations
- [x] convolutions
- [x] pixelize
- [x] node & browser "pako is not defined" when used from other project

### Notes

Convert from rgba to png:

convert -size 109x145 -depth 8 test/assets/tmptestdrawRectangle.rgba tmp2.png

Convert png to rgba

convert -depth 8 test/assets/n.png -depth 8 tmp2.rgba

 * [ ] some math libraries: https://github.com/markknol/hx-vector2d/blob/master/src/geom/Vector2d.hx, https://github.com/tbrosman/hxmath/blob/master/test/Test2D.hx, https://github.com/ramchale/quick-haxe/blob/master/quick_haxe/path/Path.hx

### OT

 * geomtrize-haxe : may be checking with Sure is expensive so: implement macro or conditionals to not compile those statement if an option or compile arg is given.
 * haxe library to call ImageMagick commands in ALL targets (and browser). In non js targets user needs to have installed ImageMatick and we spawn. In the browser , with the same API, use https://www.npmjs.com/package/magica emscripten port of IM. 


### Performance notes
 * before: 
  *  real    0m34.359s user    0m28.755s sys     0m2.693s
  *  real 0m33.955s user    0m28.450s sys     0m2.654s
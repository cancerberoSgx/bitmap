## TODO

- [ ] verify that bitmap.compare is working correctly. also copyFrom, both  with different bounds and regions.
- [W] easy API for common affine transforms like rotate, translate, skew
- [] easy API for bitmap.colors like contrast, bright, sepia, etc
- [W] easy API for common convolutions like blur, sharpen, edges, etc
- [w] export the library to other target's library by @:exposing public API( so non haxe users can also use it)
  - [w] support typescript definitions
- [ ] bitmap.util.clip() - creates a new bitmap from a region.
- [ ] bitmap.util.scale(region, x, y) - both a bitmap resize and affine resize creating a larger bitmap if necessary.
- [ ] performance tests and track performance.
- [ ] bitmap.util.write(src:Bitmap, region:Rectangle, blend:Blend, factor:float) 
  - [ ] bitmap.compose(otherBitmap, region, blend, factor): creates a new bitmap 
- [ ] code formatter
- [ ] bitmap.color.tint({color: Color.create(222,11,43, 255), intensity: 111})  .. so we can grayscale, sepia, https://en.wikipedia.org/wiki/Cyanotype
- [ ] color replace - threshold
- [ ] write tutorial page showing the effect of API, get, draw, transformations, etc
- [ ] remove the borders of convolution result by copying neighbor
- [ ] bitmap.setOffset(bounds):Bitmap : offset support for bitmap: width, height, set, get methods in coordinates relative to `offset` property. Use case, work only on a region of the bitmap. Multiple bitmap referencing the same data
  - [ ] bitmap.view(bounds?:Rectangle):Bitmap // returns a new Bitmap but using the same data so modifications will affect both
- [ ] browser test (sh test.sh should verify that at least the browser example renders whet it should,)
- [ ] iterate faster with UInt32Array http://jsfiddle.net/cancerbero_sgx/h824Lq0n/4/
- [ ] cli should automatically execute like this https://github.com/HaxeCheckstyle/haxe-formatter/   - haxelib install bitmap && haxelib run bitmap --input... 
- [ ] color libraries  supports spaces, format conversions and interpolations with no dependencies: https://lib.haxe.org/p/thx.color/, https://lib.haxe.org/p/hxColorToolkit/
- [ ] test errors - opening invalid content, saving to invalid output, copy() out range.
- [ ] image metadata?
- [ ] visual image diff 
- [ ] html canvas bitmap. option 1: abstract bitmap to canvas as fast as possible. Option 2: instead of being written to bytes, let's just write pixels to canvas directly?
- [ ] dither: img.dither({colors:16}) will reduce image colors to only 16 different ones. (https://github.com/pierre-muth/selfpi/blob/master/src/selfpi/Dithering.java)
- [ ] chained transformations. bitmap.resize(1,b).rotate(g).copyFrom(b2, rect4).convolve(j).save('foo.png')
- [ ] better productize the CLI, perhaps in separate project.
- [ ] check this fft impl: https://github.com/deltaluca/goodies#FFT
- [x] performance - libraries do const idx = (image.bitmap.width * _y + _x) << 2 instead *4
- [ ] bitmap.scan({x: 0, y:0,w:11, h:111, f: (x,y,idx,bitmap)->{if bitmap.get(x.y)==ddd return true/*stops iteration*/})
- [ ] img1.mask(img2) (Masks a source image on to this image using average pixel colour. A completely black pixel on the mask will turn a pixel in the image completely transparent.)
- [ ] bitmaps as resources
- [x] affine background not working.
- [x] color filter to accept coordinates also so it can make gradients
- [x] bitmap.color.grayScale()
- [x] bitmap.color.sepia()
- [x] browser example. load png from url, draw/transform and render it back again as img.
- [x] color transformations: bright, contrast, replace-color
- [x] load image from url should work in all targets
- [x] document CLI
- [x] dox
- [x] browser: load bitmap form html input file
- [x] refactor Affine: AffineTransform will have the transform() method for Transform, and Affine can be instantiated by user, transformed/multiplied/interpolate and passed as option. remove Matrix and define a,b,c,... as Affine props.
- [x] bitmap.copy(bounds?:Rectangle):Bitmap
- [x] check https://github.com/martamius/Exif.hx and see if with format.jpg read/write jpg could be supported
- [x] transformations modify not respected
- [x] bitmap.util.compare():number - move equals to bitmap.util
- [x] in32 and in8 configurable modes for get/set
- [x] affine issues : lots doesn't work like rotate, flipY. The ones using negative values...
- [x] ensure that Bitmaps never throw error when drawing outside their canvas if noRangeCheck=true
- [x] affine transformations
- [x] convolutions
- [x] pixelize
- [x] node & browser "pako is not defined" when used from other project

### Notes

- investigate other transformation than affine like perspective transformation and polar trnsformation: https://docs.opencv.org/master/da/d54/group__imgproc__transform.html

- [ ] **magica and bitmap** bitmap and magica could complement magica very well. magica (ImageMagick) is a complete professional suite, but slow for individual pixel manipulation since its based not in IM API but in IM CLI (which is not designed for individual pixel manipulation but file batch processing). If this project could provide a fast API to fast per-pixel API and use magica for professional/complex manipulations and format conversion - it would be ideal couple. 

- [ ] floodfill https://www.hackerearth.com/practice/algorithms/graphs/flood-fill-algorithm/tutorial/ https://guide.freecodecamp.org/algorithms/flood-fill/

- [ ] boundary fill https://guide.freecodecamp.org/algorithms/boundary-fill

**Using IM to Convert from rgba to png:**
`convert -size 109x145 -depth 8 test/assets/tmptestdrawRectangle.rgba tmp2.png`
**Convert png to rgba:**
`convert -depth 8 test/assets/n.png -depth 8 tmp2.rgba`

- [] checkout these tests https://github.com/oliver-moran/jimp/blob/master/packages/plugin-mask/test/mask.test.js !
 * [ ] some math libraries: https://github.com/markknol/hx-vector2d/blob/master/src/geom/Vector2d.hx, https://github.com/tbrosman/hxmath/blob/master/test/Test2D.hx, https://github.com/ramchale/quick-haxe/blob/master/quick_haxe/path/Path.hx

 * this project http://kvazars.com/littera/ is able to generate a transparent png and font spec in xml form a ttf. We can implement a feature to render text in a bitmap with it.
   * other apps : http://fontforge.github.io/en-US/, https://lib.haxe.org/p/gl3font
   * https://github.com/oliver-moran/jimp/blob/master/packages/jimp/fonts/open-sans/open-sans-64-white/open-sans-64-white.fnt
 * circle: https://github.com/oliver-moran/jimp/blob/master/packages/plugin-circle/src/index.js

 * gradientgenerator: https://github.com/pierre-muth/selfpi/blob/master/src/tests/GradientGenerator.java
 * dithering : https://github.com/pierre-muth/selfpi/blob/master/src/selfpi/Dithering.java
  * morphology : https://github.com/DanielRapp/morph/blob/master/morph.js
   * image segmentation - contaours: https://github.com/pmneila/morphsnakes/blob/master/morphsnakes.py
### OT

- [ ] fix haxe cookbook "macro combine structures" to support haxe 4 (Use ObjectField)
 * geomtrize-haxe : may be checking with Sure is expensive so: implement macro or conditionals to not compile those statement if an option or compile arg is given.
 * haxe library to call ImageMagick commands in ALL targets (and browser). In non js targets user needs to have installed ImageMatick and we spawn. In the browser , with the same API, use https://www.npmjs.com/package/magica emscripten port of IM. 


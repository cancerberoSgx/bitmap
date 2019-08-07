import test from 'ava'
import { File, imageCompare } from 'magica'
import { BitmapIO, Color, IOUtil, PNGBitmap, BitmapUtil } from '../src'

test.cb('load image from url w IOUtil.fetch', t => {
  var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png'
  IOUtil.fetch(url, async (err, data) => {
    if (err != null) {
      return t.end(err)
    }
    var bitmap = PNGBitmap.create(data)
    t.deepEqual(BitmapUtil.compare(bitmap, PNGBitmap.create(IOUtil.readFile('test/assets/parrots_orig.png'))), 0)
    BitmapIO.writeBitmap('tmp_ww.png', bitmap)
    t.true(await imageCompare(await File.fromFile('tmp_ww.png'), await File.fromFile('test/assets/parrots_orig.png')))
    t.end()
  })
})

test('load image from url w IOUtil.fetch proise signature', async t => {
  var url = 'https://cancerberosgx.github.io/demos/magica/images/parrots_orig.png'
  const { error, data } = await IOUtil.fetch(url)
  t.falsy(error)
  var bitmap = PNGBitmap.create(data)
  t.deepEqual(BitmapUtil.compare(bitmap, PNGBitmap.create(IOUtil.readFile('test/assets/parrots_orig.png'))), 0)
  BitmapIO.writeBitmap('tmp_ww.png', bitmap)
  t.true(await imageCompare(await File.fromFile('tmp_ww.png'), await File.fromFile('test/assets/parrots_orig.png')))
}) 

import test from 'ava' 
import {bitmap} from '../src'
import {File} from 'magica'
test('importing using namespace', async t => {
  const input = bitmap.IOUtil.readFile('test/assets/n.png')
  var b =  bitmap.PNGBitmap.create(input)
  b.draw.rectangle2(10,10,30,30,bitmap.Color.create(20,200,10,128), true)
  await bitmap.BitmapIO.writeBitmap('tmp2.png', b)
  var f = await File.fromFile('tmp2.png')
  t.true(await f!.equals(await File.fromFile('test/asserts/rect1.png')))
})

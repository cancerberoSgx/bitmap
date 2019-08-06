import test from 'ava' 
import {IOUtil, PNGBitmap, Color, BitmapIO} from '../src'
import {File} from 'magica'

test('importing directly', async t => {
  const input = IOUtil.readFile('test/assets/n.png')
  var b =  PNGBitmap.create(input)
  b.draw.rectangle2(10,10,30,30,Color.create(20,200,10,128), true)
  await BitmapIO.writeBitmap('tmp1.png', b)
  var f = await File.fromFile('tmp1.png')
  t.true(await f!.equals(await File.fromFile('test/asserts/rect1.png')))
})

import test from 'ava'
import { bitmap } from '../src'
import { IOUtil, PNGBitmap, Color, BitmapIO } from '../src'
import { File, imageCompare } from 'magica'
import { imageCompareNumber } from 'magica/dist/src/image/imageCompare'

test('importing using namespace', async t => {
  var f = await nDraw('test/assets/n.png', 'tmp2.png')
  t.true(await f!.equals(await File.fromFile('test/assets/rect1.png')))
})

test('importing directly', async t => {
  var f = await nDraw('test/assets/n.png', 'tmp1.png')
  t.true(await f!.equals(await File.fromFile('test/assets/rect1.png')))
})

async function nDraw(inputFile: string, n: string) {
  const input = IOUtil.readFile(inputFile)
  var b = PNGBitmap.create(input)
  b.draw.rectangle2(10, 10, 30, 30, Color.create(20, 200, 10, 128), true)
  BitmapIO.writeBitmap(n, b)
  return await File.fromFile(n)
}


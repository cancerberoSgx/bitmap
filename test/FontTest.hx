import utest.Assert;
import bitmap.*;
import bitmap.text.FontManager;
import bitmap.Types.Blend;

class FontTest implements utest.ITest {
	public function new() {}

	public function testRegisterFont() {
		var manager = FontManager.getInstance();
		var font = manager.registerFont({
			img: IOUtil.readFile("test/assets/openSans.png"),
			fmt: IOUtil.readFile("test/assets/openSans.xml"),
			fontFamily: 'openSans'
		});
		Assert.same([425, 81], [font.getGlyph(124).y, font.getGlyph(124).bitmap.height]);
		var r = manager.render({
			text: 'hello world',
			fontFamily: 'openSans',
			x: 10,
			y: 20,
			bitmap: PNGBitmap.create(IOUtil.readFile("test/assets/bluebells.png"))
		});
		BitmapIO.writeBitmap('test/assets/tmpFont1.png', r.bitmap);
	}
}

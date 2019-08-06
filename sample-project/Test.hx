import bitmap.*;
class Test {
  public static function main(){
    var bitmap = PNGBitmap.create(IOUtil.readFile("n.png"));	
    bitmap.set(30, 20, Color.create(23, 233, 111, 128)); 	
    bitmap.draw.rectangle({x: 10, y: 20, width: 40, height: 22, c: Color.create(12, 144, 0, 131), fill: true});
    BitmapIO.writeBitmap('tmpOutput.png', bitmap);
    var bitmap2 = PNGBitmap.create(IOUtil.readFile("tmpOutput.png"));	
    if(!BitmapUtil.bitmapEquals(bitmap, bitmap2)){
      throw "Expected nitmaps to be equal";
    }
    trace("No errors");
  }
}
package bitmap;

import bitmap.*;

class BitmapUtil {
	public static inline function colorEquals(a:bitmap.Color, b:bitmap.Color) {
		return a.r==b.r&&a.g==b.g&&a.b==b.b&&a.a==b.a;
	}

	public static function bitmapEquals(a:Bitmap, b:Bitmap, ?debug:Bool) {
    // if(debug==true){
    //       trace("a.width", a.width, "b.width", b.width, "a.height", a.height, "b.height", b.height);
    //     }
    if(a.width!=b.width||a.height!=b.height){
      return false;
    }
		for (y in 0...a.height) {
			for (x in 0...a.width) {
				var c1 = a.get(x, y);
				var c2 = b.get(x, y);
        // if(debug==true){
        //   trace(colorEquals(c1,c2), c1, c2);
        // }
				if (!colorEquals(c1,c2)) {
					return false;
				}
			}
		}
		return true;
	}

	public static function drawRectangle(b:Bitmap, x:Int,y:Int,width:Int,height:Int, c:bitmap.Color, ?fill:Bool, ?blend:Blend) {
		b.draw.rectangle({x:x,y:y,width:width,height:height, c:c, fill:fill, blend:blend});
	}

	/**
	 * adapted from http://www.brackeen.com/vga/source/djgpp20/lines.c.html
	**/
	public static function drawLine(bitmap:Bitmap, x1:Int, y1:Int, x2:Int, y2:Int, c:Color,?blend:Blend) {
    bitmap.draw.line(x1,y1, x2, y2, c,blend);
	}

public static function blendBitmaps(b1:Bitmap, b2:Bitmap, ? b3:Bitmap,?mode:Blend){
  var w = Util.min(b1.width, b2.width);
  var h = Util.min(b1.height, b2.height);
  b3 = b3==null ? b1 : b3;
  for(y in 0...h){
    for(x in 0...w){
      var c = blendColors(b1.get(x,y), b2.get(x,y), mode);
      b3.set(x,y,c);
    }
  }
  return b3;
}

public static function blendColors(c1:Color, c2:Color, ?mode:Blend){
  if(mode==Blend.alpha) {
    return c2;
  }
  else if(mode==Blend.mean) {
    return Color.create(Std.int((c1.r+c2.r)/2), Std.int((c1.g+c2.g)/2), Std.int((c1.b+c2.b)/2), Std.int((c1.a+c2.a)/2));
  }
  else {
    return c2;
  }
	// // Convert the non-premultiplied color to alpha-premultiplied 16-bits per channel RGBA
	// 	// In other words, scale the rgb color components by the alpha component
	// 	var sr:Int = c1.r;
	// 	sr |= sr << 8;
	// 	sr *= c1.a;
	// 	sr = Std.int(sr / 0xFF);
	// 	var sg:Int = c1.g;
	// 	sg |= sg << 8;
	// 	sg *= c1.a;
	// 	sg = Std.int(sg / 0xFF);
	// 	var sb:Int = c1.b;
	// 	sb |= sb << 8;
	// 	sb *= c1.a;
	// 	sb = Std.int(sb / 0xFF);
	// 	var sa:Int = c1.a;
	// 	sa |= sa << 8;

	// 		var ma:Int = 65535;
	// 		var m:Int = 65535;
	// 		var as:Float = (m - (sa * (ma / m))) * 257;
	// 		var a:Int = Std.int(as);

  //   // var d:Rgba = image.getPixel(x, y);
	// 			// var d = bitmap.get(x,y);
	// 			var dr:UInt = c2.r;
	// 			var dg:UInt = c2.g;
	// 			var db:UInt = c2.b;
	// 			var da:UInt = c2.a;
				
	// 			// Blend the color components
	// 			var r:UInt = Std.int((dr * a + sr * ma) / m) >> 8;
	// 			var g:UInt = Std.int((dg * a + sg * ma) / m) >> 8;
	// 			var b:UInt = Std.int((db * a + sb * ma) / m) >> 8;
	// 			var a:UInt = Std.int((da * a + sa * ma) / m) >> 8;
  //       return Color.create(r,g,b,a);
}
  
		


	// 	public static function drawEllipse(b:Bitmap, x:Int, y:Int, width:Int, height:Int, c:bitmap.Color) {
	// var step = 2*Math.PI/20;  // see note 1
	//     var h = 150;
	//     var k = 150;
	//     var r = 50;
	//     ctx.beginPath();  //tell canvas to start a set of lines
	//     for(var theta=0;  theta < 2*Math.PI;  theta+=step)
	//      {
	//         var x = h +       r*Math.cos(theta) ;
	//        var y = k - 0.5 * r*Math.sin(theta) ;
	//        ctx.lineTo(x,y);
	//      }
	//     /*
	//     var step = 2*Math.PI/20;  // see note 1
	//     var h = 150;
	//     var k = 150;
	//     var r = 50;
	//     ctx.beginPath();  //tell canvas to start a set of lines
	//     for(var theta=0;  theta < 2*Math.PI;  theta+=step)
	//      {
	//         var x = h +       r*Math.cos(theta) ;
	//        var y = k - 0.5 * r*Math.sin(theta) ;
	//        ctx.lineTo(x,y);
	//      }
	//     ctx.closePath();     //
	//     */
	//     // var e = new Ellipse(x,y,width, height);
	// 		// var lines = e.rasterize();
	//     // trace(lines);
	//     // for(line in lines){
	//     //   for(x_ in Util.min(line.x1, line.x2)...Util.max(line.x1, line.x2)) {
	//     //     b.set(x+x_, y+line.y, c);
	//     //   }
	//     // }
	// 	}
}

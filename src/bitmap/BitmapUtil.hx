package bitmap;

import bitmap.*;
import bitmap.draw.Ellipse;

class BitmapUtil {
	public static inline function colorEquals(a:bitmap.Color, b:bitmap.Color) {
		return a == b;
	}

	public static function bitmapEquals(a:Bitmap, b:Bitmap) {
		for (y1 in 0...a.height) {
			for (x1 in 0...a.width) {
				var c1 = a.get(x1, y1);
						var c2 = a.get(x1, y1);
						if (!colorEquals(c1, c2)) {
							return false;
						}
			}
		}
		return true;
	}

	public static function drawRectangle(b:Bitmap, r:Rectangle, c:bitmap.Color) {
		for (y in 0...r.height) {
			for (x in 0...r.width) {
				b.set(x + r.x, y + r.y, c);
			}
		}
	}
  
	public static function drawEllipse(b:Bitmap, x:Int, y:Int, width:Int, height:Int, c:bitmap.Color) {
    var e = new Ellipse(x,y,width, height);
		var lines = e.rasterize();
    trace(lines);
    for(line in lines){
      for(x_ in Util.min(line.x1, line.x2)...Util.max(line.x1, line.x2)) {
        b.set(x+x_, y+line.y, c);
      }
    }
	}

/**
 * adapted from http://www.brackeen.com/vga/source/djgpp20/lines.c.html
**/
public static function drawLine(bitmap:Bitmap, x1:Int,y1:Int,x2:Int,y2:Int,c:Color) {
var  dx:Int,dy:Int,sdx:Int,sdy:Int,dxabs:Int,dyabs:Int,x:Int,y:Int,px:Int,py:Int;
  dx=x2-x1;      /* the horizontal distance of the line */
  dy=y2-y1;      /* the vertical distance of the line */
  dxabs=Util.abs(dx);
  dyabs=Util.abs(dy);
  sdx=Util.sgn(dx);
  sdy=Util.sgn(dy);
  x=dyabs>>1;
  y=dxabs>>1;
  px=x1;
  py=y1;
  if (dxabs>=dyabs) { /* the line is more horizontal than vertical */
     for(i in 0...dxabs)    {
      y+=dyabs;
      if (y>=dxabs)
      {
        y-=dxabs;
        py+=sdy;
      }
      px+=sdx;
      bitmap.set(px,py,c);
    }
  }
  else /* the line is more vertical than horizontal */
  {
    for(i in 0...dyabs)    {
      x+=dxabs;
      if (x>=dyabs)      {
        x-=dyabs;
        px+=sdx;
      }
      py+=sdy;
       bitmap.set(px,py,c);
    }
  }
}
}

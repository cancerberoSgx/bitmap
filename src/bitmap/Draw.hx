package bitmap;

import bitmap.*;

class Draw {
	private var bitmap:Bitmap;

	public function new(b:Bitmap) {
		bitmap = b;
	}

	/**
	 * adapted from http://www.brackeen.com/vga/source/djgpp20/lines.c.html
	**/
	public function line(x1:Int, y1:Int, x2:Int, y2:Int, c:Color, ?blend:Types.Blend, ?returnPoints=false) {
		var dx:Int, dy:Int, sdx:Int, sdy:Int, dxabs:Int, dyabs:Int, x:Int, y:Int, px:Int, py:Int;
		dx = x2 - x1; /* the horizontal distance of the line */
		dy = y2 - y1; /* the vertical distance of the line */
		dxabs = Util.abs(dx);
		dyabs = Util.abs(dy);
		sdx = Util.sgn(dx);
		sdy = Util.sgn(dy);
		x = dyabs >> 1;
		y = dxabs >> 1;
		px = x1;
		py = y1;
    var points: Array<Types.Point>=[];
		if (dxabs >= dyabs) { /* the line is more horizontal than vertical */
			for (i in 0...dxabs) {
				y += dyabs;
				if (y >= dxabs) {
					y -= dxabs;
					py += sdy;
				}
				px += sdx;
				set(px, py, c, blend);
        points.push({x:px,y:py});
			}
		} else { /* the line is more vertical than horizontal */
			for (i in 0...dyabs) {
				x += dxabs;
				if (x >= dyabs) {
					x -= dyabs;
					px += sdx;
				}
				py += sdy;
				set(px, py, c, blend);
        points.push({x:px,y:py});
			}
		}
    return points;
	}

	public function rectangle(r:RectangleShape) {
		if (r.fill) {  
			for (y2 in 0...r.height) {
				for (x2 in 0...r.width) {
					set(x2 + r.x, y2 + r.y, r.c, r.blend);
				}
			}
		} else {
			line(r.x, r.y, r.x + r.width, r.y, r.c, r.blend);
			line(r.x + r.width, r.y, r.x + r.width, r.y + r.height, r.c, r.blend);
			line(r.x + r.width, r.y + r.height, r.x, r.y + r.height, r.c, r.blend);
			line(r.x, r.y + r.height, r.x, r.y, r.c, r.blend);
		}
	}

	public function rectangle2(x:Int, y:Int, width:Int, height:Int, c:Color, ?fill:Bool, ?blend:Types.Blend) {
		rectangle({
			x: x,
			y: y,
			width: width,
			height: height,
			c: c,
			fill: fill,
			blend: blend
		});
	}

  public function triangle(x1:Int, y1:Int, x2:Int, y2:Int, x3:Int, y3:Int, c:Color, ?fill=false, ?blend:Types.Blend) {   
    var points = line(x1,y1,x2,y2,c,blend,fill);
    points = points.concat(line(x2,y2,x3,y3,c,blend, fill));
    points = points.concat(line(x3,y3,x1,y1,c,blend, fill));
    if(!fill){
      return;
    }
    var maxY = Util.max(y1, Util.max(y2, y3));
    var minY = Util.min(y1, Util.min(y2, y3));
    for(y in minY...maxY+1) {
      var found = points.filter(function(p)return Math.round(p.y)==y);
      if(found.length>1){
        // found.forEach(function(f){
        //   line(f.x, f.y, found[1].x, found[1].y,c,blend );
        // })
        if(found.length>2) {
var e = Util.minMaxElements(found.map(function(p)return p.x));
// var p1 = found.find(function(p)return p.x==e.min);
// var p2 = found.find(function(p)return p.x==e.max);
line(e.min,  y, e.max,  y,c,blend );
// // line(e.max,  y, found[1].x,  y,c,blend );

//     var maxX = found.find(function(p)return)
//     var minX = Util.min(y1, Util.min(y2, y3));
        }else {
        line(found[0].x,  y, found[1].x,  y,c,blend );
        }
        // if(found.length>2){
        // line(found[1].x, found[1].y, found[2].x, found[2].y,c,blend );
        // line(found[0].x, found[0].y, found[2].x, found[2].y,c,blend );
        // }
      }
      else if (found.length==1) {
        set(found[0].x, found[0].y, c, blend);
      }
      else {
        trace(found.length);
      }
    }
  }

	private inline function set(x:Int, y:Int, c:Color, ?blend:Types.Blend) {
		bitmap.set(x, y, (blend == null || blend == Types.Blend.none) ? c : ColorUtil.blendColors(bitmap.get(x, y), c, blend));
	}
}

typedef DrawShape = {
	@:optional var fill:Bool;
	var c:bitmap.Color;
	@:optional var blend:Types.Blend;
	var x:Int;
	var y:Int;
};

typedef LineShape = {
	> DrawShape,
	var x2:Int;
	var y2:Int;
};

typedef RectangleShape = {
	> DrawShape,
	var width:Int;
	var height:Int;
};

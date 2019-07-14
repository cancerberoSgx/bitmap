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
	public function line(x1:Int, y1:Int, x2:Int, y2:Int, c:Color, blend:Types.Blend) {
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
		if (dxabs >= dyabs) { /* the line is more horizontal than vertical */
			for (i in 0...dxabs) {
				y += dyabs;
				if (y >= dxabs) {
					y -= dxabs;
					py += sdy;
				}
				px += sdx;
				set(px, py, c, blend);
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
			}
		}
	}

	public function rectangle(r:RectangleShape) {
		if (r.fill) { // haxe issue: r.fill==true is always false
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

	private inline function set(x:Int, y:Int, c:Color, ?blend:Types.Blend) {
		bitmap.set(x, y, (blend == null || blend == Types.Blend.none) ? c : BitmapUtil.blendColors(bitmap.get(x, y), c, blend));
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

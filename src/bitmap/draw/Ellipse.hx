package bitmap.draw;
import bitmap.draw.Line;
class Ellipse {
  public var width:Int;
  public var height:Int;
  public var x:Int;
  public var y:Int;
  public var rx:Int;
  public var ry:Int;
  public function new(x_:Int, y_:Int, width_:Int, height_:Int) {
    width = width_;
    height=height_;
    x=x_;
    y=y_;
		// x = Std.random(width);
		// y = Std.random(height);
		rx = Std.random(132) + 1;
		ry = Std.random(132) + 1;		
	}

	public function rasterize():Array<Line> {
		var lines:Array<Line> = [];
		var aspect:Float = rx / ry;
			
		for (dy in 0...ry) {
			var y1:Int = y - dy;
			var y2:Int = y + dy;
			if ((y1 < 0 || y1 >= height) && (y2 < 0 || y2 >= height)) {
				continue;
			}
			var s:Int = Std.int(Math.sqrt(ry * ry - dy * dy) * aspect);
			var x1:Int = x - s;
			var x2:Int = x + s;
			if (x1 < 0) {
				x1 = 0;
			}
			if (x2 >= width) {
				x2 = width - 1;
			}
			if (y1 >= 0 && y1 < height) {
				lines.push({y: y1, x1: x1, x2: x2});
			}
			if (y2 >= 0 && y2 < height && dy > 0) {
				lines.push({y: y2, x1: x1, x2: x2});
			}
		}		
    
		return trim(lines, width, height);
	}

	/**
	 * Crops the scanning width of an array of scanlines so they do not scan outside of the given area.
	 * @param	lines	The scanlines to crop.
	 * @param	w	The width to crop.
	 * @param	h	The height to crop.
	 * @return	Array of the cropped scanlines.
	 */
	public static function trim(lines:Array<Line>, w:Int, h:Int):Array<Line> {
		return lines.filter(trimHelper.bind(_, w, h));
	}
	
	private static inline function trimHelper(line:Line, w:Int, h:Int):Bool {
		// if (line.y < 0 || line.y >= h || line.x1 >= w || line.x2 < 0) {
		// 	return false;
		// }
		line.x1 = Util.clamp(line.x1, 0, w - 1);
		line.x2 = Util.clamp(line.x2, 0, w - 1);
		return (line.x1 <= line.x2);
	}
}

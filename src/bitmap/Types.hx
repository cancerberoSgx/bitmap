package bitmap;

import bitmap.*;

enum Blend {
	alpha;
	mean;
	none;
}

typedef ColorBlend = {
  var type: Blend;
  @:optional var factor:Float;
};

typedef Point = {
	x:Int,
	y:Int
};

typedef FloatPoint = {
	x:Float,
	y:Float
};

typedef Rectangle = {
	> Point,
	width:Int,
	height:Int
};

enum PixelFormat {
	RGBA;
	ARGB;
}

enum Background {
  bg;
  none;
}
package bitmap;

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

typedef Area = {
	var width:Int;
	var height:Int;
};

typedef OptionalArea = {
@:optional 	var width:Int;
@:optional var height:Int;
};

typedef Rectangle = {
	> Point,
  > Area,
};

enum PixelFormat {
	RGBA;
	ARGB;
}

enum Background {
  bg;
  none;
}

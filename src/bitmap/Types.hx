package bitmap;

@:expose enum Blend {
	alpha;
	mean;
	none;
}

@:expose typedef ColorBlend = {
  var type: Blend;
  @:optional var factor:Float;
};

@:expose typedef Point = {
	x:Int,
	y:Int
};

@:expose typedef FloatPoint = {
	x:Float,
	y:Float
};

@:expose typedef Area = {
	var width:Int;
	var height:Int;
};

@:expose typedef OptionalArea = {
@:optional 	var width:Int;
@:optional var height:Int;
};

@:expose typedef Rectangle = {
	> Point,
  > Area,
};

@:expose enum PixelFormat {
	RGBA;
	ARGB;
}

@:expose enum Background {
  bg;
  none;
}

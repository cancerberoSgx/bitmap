package bitmap.cli;
using bitmap.support.StructureTools;

class CliMain {
	public static function main() {
		var options = bitmap.support.CliUtil.parse(IOUtil.args()).map;
		if (options["help"] != null) {
			printHelp();
			IOUtil.exit(0);
		}
		if (options["input"] == null
			|| options["input"] == ""
			|| options["output"] == null || options["output"] == "" || options["config"] == null || options["config"] == "") {
			trace("Error: \n--input --output and --config arguments are mandatory.");
			printHelp();
			IOUtil.exit(1);
		}
		var config = haxe.Json.parse(bitmap.IOUtil.readTextFile(options["config"]));
		handleTransformations(config, options);
	}

	static function printHelp() {
		trace("Usage: \nbitmap --input img.png --config effect1.json --output img_out.png");
	}

	static function handleTransformations(config:Dynamic, args:Map<String, String>) {
		var bitmap:bitmap.Bitmap = PNGBitmap.create(IOUtil.readFile(args['input']));
		bitmap.noRangeCheck = true;
		for (i in 0...config.length) {
			bitmap = handleTransformation(config[i], bitmap);
		}
		BitmapIO.writeBitmap(args['output'], bitmap);
	}

	static function handleTransformation(config:Dynamic, bitmap:Bitmap) {
		if (config.transformation == 'pixelize') {
			var width = config.width == null ? bitmap.width / 10 : config.width;
			var height = config.height == null ? bitmap.height / 10 : config.height;
			return bitmap.transform.pixelize({
				width: Math.round(width),
				height: Math.round(height),
				output: bitmap,
				alpha: 255
			});
		}
		if (config.transformation == 'rotate') {
			var degrees = config.degrees == null ? 33 : config.degrees;
			var result = bitmap.transform.affine({
				affine: new bitmap.transformation.Affine().rotateDeg(degrees),
				region: config.region,
				precision: config.precision
			});
			return result.bitmap;
		}
		if (config.transformation == 'scale') {
			var x = config.x == null ? bitmap.width / 10 : config.x;
			var y = config.y == null ? bitmap.height / 10 : config.y;
			var result = bitmap.transform.affine({
				affine: new bitmap.transformation.Affine().scale(x, y),
				region: config.region,
				precision: config.precision
			});
			return result.bitmap;
		}
		if (config.transformation == 'translate') {
			var x = config.x == null ? bitmap.width / 10 : config.x;
			var y = config.y == null ? bitmap.height / 10 : config.y;
			var result = bitmap.transform.affine({
				affine: new bitmap.transformation.Affine().translate(x, y),
				region: config.region,
				precision: config.precision
			});
			return result.bitmap;
		} else {
			throw "Unknown transformation " + config.transformation;
		}
	}
}

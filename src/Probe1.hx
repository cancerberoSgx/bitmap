// // package bitmap;

// import format.png.Data;
// import format.png.Data.Header;
// import format.png.Reader;
// import format.png.Tools;
// import format.png.Writer;
// import haxe.io.Path;
// import sys.io.File;
// import sys.io.FileInput;
// import sys.io.FileOutput;
// import util.PixelFormat;


// class Main {
//   // Reads a PNG image from disk and returns an RGBA8888 Bitmap that the Geometrize library can work with
// 	private static function readPNGImage(filePath:Path) {
// 		try {
// 			var handle:FileInput = sys.io.File.read(filePath.toString(), true);
// 			var d:Data = new format.png.Reader(handle).read();
// 			var hdr:Header = format.png.Tools.getHeader(d);
// 			handle.close();
			
// 			// Convert data to RGBA format
// 			var bytes = Tools.extract32(d);
// 			Tools.reverseBytes(bytes);
// 			var rgba = PixelFormatHelpers.argbToRgba(bytes);
			
// 			// return Bitmap.createFromBytes(hdr.width, hdr.height, rgba);
// 		} catch (e:Dynamic) {
// 			return null;
// 		}
// 	}

// 	// Writes an RGBA8888 Bitmap to disk as a PNG image
// 	private static function writePNGImage(filePath:Path, bitmap:Bitmap):Void {
// 		var output:FileOutput = sys.io.File.write(filePath.toString(), true);
// 		new format.png.Writer(output).write(format.png.Tools.build32BGRA(bitmap.width, bitmap.height, PixelFormatHelpers.rgbaToBgra(bitmap.getBytes())));
// 	}
	
// 	// /**
// 	//    The filepath to load the input image from
// 	// **/
// 	// public var i:String = null;
// 	// /**
// 	//    The filepath to save the output PNG image, JSON data or SVG
// 	// **/
// 	// public var o:String = null;
// 	// /**
// 	//    The type of shape to use. One of: rectangle, rotated_rectangle, triangle, ellipse, rotated_ellipse, circle, line, quadratic_bezier, polyline
// 	// **/
// 	// public var t:String = "rotated_rectangle";
// 	// /**
// 	//    Number of shapes to use in the output image
// 	// **/
// 	// public var s:Int = 250;
// 	// /**
// 	//    The number of candidate shapes per shape added to the output image
// 	// **/
// 	// public var c:Int = 500;
// 	// /**
// 	//    The maximum number of times to mutate each candidate shape
// 	// **/
// 	// public var m:Int = 100;
// 	// /**
// 	//    The opacity (0-255) of each shape added to the output image
// 	// **/
// 	// public var a:Int = 128;
	
// 	// public function runDefault() {
// 	// 	Sys.println("Running Geometrize Haxe...");
		
// 	// 	// Read the input image
// 	// 	var sourceBitmap:Bitmap = readPNGImage(new Path(i));
// 	// 	if (sourceBitmap == null) {
// 	// 		Sys.println("Failed to read PNG image at: " + i);
// 	// 		return;
// 	// 	}
		
// 	// 	// Set up the image runner options
// 	// 	var imageRunnerOptions:ImageRunnerOptions = {
// 	// 		shapeTypes: [ stringToShapeType(t) ],
// 	// 		alpha: a,
// 	// 		candidateShapesPerStep: c,
// 	// 		shapeMutationsPerStep: m
// 	// 	};
		
// 	// 	Sys.println("Will use image runner options: " + Std.string(imageRunnerOptions));
		
// 	// 	// Create image runner
// 	// 	var backgroundColor:Rgba = Util.getAverageImageColor(sourceBitmap);
// 	// 	var runner:ImageRunner = new ImageRunner(sourceBitmap, backgroundColor);
		
// 	// 	var shapeData:Array<ShapeResult> = [];
		
// 	// 	// Add the initial background rectangle for the SVG/JSON data (average image colour)
// 	// 	var targetImage = runner.getImageData();
// 	// 	var backgroundRect = new Rectangle(targetImage.width, targetImage.height);
// 	// 	backgroundRect.x1 = 0;
// 	// 	backgroundRect.y1 = 0;
// 	// 	backgroundRect.x2 = targetImage.width - 1;
// 	// 	backgroundRect.y2 = targetImage.height - 1;
// 	// 	shapeData.push({score:0, color:backgroundColor, shape:backgroundRect });
		
// 	// 	// Add shapes to the output image one by one
// 	// 	for (count in 0...s) {
// 	// 		var results = runner.step(imageRunnerOptions);
// 	// 		for (result in results) {
// 	// 			shapeData.push(result);
// 	// 			Sys.println(Std.string(count) + ": Adding shape of type " + Std.string(result.shape.getType()));
// 	// 		}
// 	// 	}
		
// 	// 	// Save the output image/data
// 	// 	if (o.endsWith(".png")) {
// 	// 		try {
// 	// 			writePNGImage(new Path(o), runner.getImageData());
// 	// 		} catch (e:Dynamic) {
// 	// 			Sys.println("Failed to save PNG image to disk with exception: " + Std.string(e));
// 	// 		}
// 	// 	} else if (o.endsWith(".svg")) {
// 	// 		try {
// 	// 			writeSVGImage(new Path(o), SvgExporter.export(shapeData, sourceBitmap.width, sourceBitmap.height));
// 	// 		} catch(e:Dynamic) {
// 	// 			Sys.println("Failed to save SVG data to disk with exception: " + Std.string(e));
// 	// 		}
// 	// 	} else if (o.endsWith(".json")) {
// 	// 		try {
// 	// 			writeJSONData(new Path(o), ShapeJsonExporter.export(shapeData));
// 	// 		} catch (e:Dynamic) {
// 	// 			Sys.println("Failed to save JSON data to disk with exception: " + Std.string(e));
// 	// 		}
// 	// 	} else {
// 	// 		Sys.println("Failed to identify output path file extension, it should be .png, .svg or .json");
// 	// 	}
// 	// }
	
// 	// private function new() {
// 	// 	super();
// 	// }
	
// 	// // Prints command-line help string
// 	// public function help() {
// 	// 	Sys.println(this.toString());
// 	// }
	
	
	
// 	// Writes an SVG image to disk
// 	private static function writeSVGImage(filePath:Path, svgData:String):Void {
// 		sys.io.File.saveContent(filePath.toString(), svgData);
// 	}
	
// 	// Writes shape JSON data to disk
// 	private static function writeJSONData(filePath:Path, jsonData:String):Void {
// 		sys.io.File.saveContent(filePath.toString(), jsonData);
// 	}
	
// 	// Try to convert a string to a shape type
// 	private static function stringToShapeType(type:String):ShapeType {
// 		return switch(type) {
// 			case "rectangle":
// 				ShapeType.RECTANGLE;
// 			case "rotated_rectangle":
// 				ShapeType.ROTATED_RECTANGLE;
// 			case "triangle":
// 				ShapeType.TRIANGLE;
// 			case "ellipse":
// 				ShapeType.ELLIPSE;
// 			case "rotated_ellipse":
// 				ShapeType.ROTATED_ELLIPSE;
// 			case "circle":
// 				ShapeType.CIRCLE;
// 			case "line":
// 				ShapeType.LINE;
// 			case "quadratic_bezier":
// 				ShapeType.QUADRATIC_BEZIER;
// 			default:
// 				Sys.println("Did not recognize provided shape type string, defaulting to circles");
// 				ShapeType.CIRCLE;
// 		}
// 	}
	
// 	// Entry point
// 	private static function main() {
// 		new mcli.Dispatch(Sys.args()).dispatch(new Main());
// 	}
// }
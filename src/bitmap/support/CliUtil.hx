package bitmap.support;

using bitmap.support.ArrayExtensions;
using StringTools;

class CliUtil {
	public static function parse(args:Array<String>) {
		var map = new Map<String, String>();
		var i = -1, stop = false;
		while (!stop) {
			i = args.findIndexOf(function(a) return a.startsWith('--'), i + 1);
			map[args[i].substring(2, args[i].length)] = (i >= args.length - 1 || args[i + 1].startsWith('--')) ? "" : args[i + 1];
			if (i > args.length || args.findIndexOf(function(a) return a.startsWith('--'), i + 1) == -1) {
				stop = true;
			}
		}
		return {
			rest: args.filter(function(s) return !s.startsWith('--')),
			map: map
		};
	}
}

package bitmap.support;

#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.Tools;
using Lambda;
#end

class StructureTools {
	public static macro function combine(rest:Array<Expr>):Expr {
		var quotes = QuoteStatus.Unquoted;
		var pos = Context.currentPos();
		var block = [];
		var cnt = 1;
		var all = new Map<String, ObjectField>();
		for (rx in rest) {
			var trest = Context.typeof(rx);
			switch (trest.follow()) {
				case TAnonymous(_.get() => tr):
					var tmp = "tmp_" + cnt;
					cnt++;
					var extVar = macro $i{tmp};
					block.push(macro var $tmp = $rx);
					for (field in tr.fields) {
						var fname = field.name;
						all.set(fname, {field: fname, expr: macro $extVar.$fname});
					}
				default:
					return Context.error("Object type expected instead of " + trest.toString(), rx.pos);
			}
		}
		var result = {expr: EObjectDecl(all.array()), pos: pos};
		block.push(macro $result);
		return macro $b{block};
	}

	public static macro function props(self:ExprOf<Dynamic>):Expr {
		var propsNames = [];
		var selfType = Context.typeof(self);
		switch (selfType.follow()) {
			case TAnonymous(_.get() => tr):
				for (field in tr.fields) {
					propsNames.push(field.name);
				}
			default:
				return Context.error("Object type expected instead of " + selfType.toString(), self.pos);
		}
		var propsStringLiterals = propsNames.map(function(name) {
			return {
				expr: EConst(CString(name)),
				pos: Context.currentPos()
			}
		});
		var arrDecl:Expr = {
			expr: EArrayDecl(propsStringLiterals),
			pos: Context.currentPos()
		};
		return macro $b{[macro $arrDecl]};
	}

	public static macro function set(self:ExprOf<Dynamic>, name:String, value:Expr) {
		return {
			expr: EBinop(OpAssign, {
				expr: EField(macro ${self}, name),
				pos: Context.currentPos()
			}, macro ${value}),
			pos: Context.currentPos()
		};
	}

	public static macro function get(self:ExprOf<Dynamic>, name:String) {
		return {
			expr: EField(macro ${self}, name),
			pos: Context.currentPos()
		};
	}

	// tests
	// static function StructureTools() {
	// 	var a = {
	// 		foo: 1,
	// 		bar: ""
	// 	};
	// 	var b = {
	// 		bar: "he"
	// 	};
	//   trace(a.props(), b.props());
	// 	var c = a.combine(b);
	// 	trace(c.get('foo'), c.get('bar'));
	// 	c.set('foo', 2);
	// 	c.set('bar', 'sdf');
	// 	trace(c.get('foo'), c.get('bar'));
	// }
	static public function assign(o1:Dynamic, o2:Dynamic, o3:Dynamic) {
		var fields = Reflect.fields(o1).concat(Reflect.fields(o2)).concat(Reflect.fields(o3)); // TODO: dedup
		for (f in fields) {
			var v = Reflect.field(o3, f) || Reflect.field(o2, f) || Reflect.field(o1, f);
			Reflect.setField(o1, f, v);
		}
		return o1;
	}
}

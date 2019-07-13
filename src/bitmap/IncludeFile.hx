package bitmap;
import haxe.macro.Context;
import haxe.macro.Expr;
class IncludeFile {

public static macro function includeFile( fileName : Expr ) {
    /*
        Extract the input, `fileName`, as a String.
    */
    var str = switch( fileName.expr ) {
    case EConst(c):
        switch( c ) {
        case CString(str): str;
        default: null;
        }
    default: null;
    }
    if( str == null ) Context.error("Should be a constant string", fileName.pos);

    /*
        Load the file content into variable `f`.
    */
    var f = try sys.io.File.getContent(Context.resolvePath(str)) catch( e : Dynamic ) Context.error(Std.string(e), fileName.pos);

    /*
        Return an expression, which is in the form of `untyped __js__("file_content")`.
        Note that it can be written in a simpler way using expression reification:
        ```
        return macro untyped __js__($v{f});
        ```
    */
    var p = Context.currentPos();
    return { expr : EUntyped( { expr : ECall( { expr : EConst(CIdent("__js__")), pos : p }, [ { expr : EConst(CString(f)), pos : p } ]), pos : p } ), pos : p };
}
}
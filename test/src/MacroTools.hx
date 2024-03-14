import haxe.crypto.Base64;
import haxe.macro.PositionTools;
import haxe.macro.Context;
import haxe.macro.ExprTools;
import haxe.macro.Expr;

class MacroTools
{
	/**
	 * Load text file as string at compile time. Path to file is related to the source file where macro is called.
	 * Example: `var s = stdlib.Macro.embedFile("test.html");`
	 */
	public static macro function embedFile(filePath:Expr)
	{
		var path = haxe.io.Path.directory(PositionTools.getInfos(Context.currentPos()).file) + "/" + ExprTools.getValue(filePath);
		Context.registerModuleDependency(Context.getLocalModule(), path);
        final text = Base64.encode(sys.io.File.getBytes(path));
		return sys.FileSystem.exists(path) ? macro $v{text} : macro "";
	}    
}
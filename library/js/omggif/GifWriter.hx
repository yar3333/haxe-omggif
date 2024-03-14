package js.omggif;

@:native("GifWriter")
#if hxnodejs @:jsRequire("omggif", "GifWriter") #end
extern class GifWriter
{
	var height : Int;
	var width : Int;

	function new(buf:GifBinary, width:Int, height:Int, ?gopts:GifOptions) : Void;
	function addFrame(x:Int, y:Int, w:Int, h:Int, indexed_pixels:Array<Int>, ?opts:FrameOptions) : Int;
	function end() : Int;
	function getOutputBuffer() : GifBinary;
	function getOutputBufferPosition() : Int;
	function setOutputBuffer(v:GifBinary) : Void;
	function setOutputBufferPosition(v:Int) : Void;
}
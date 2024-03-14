package js.omggif;

import haxe.extern.EitherType;
import haxe.io.Bytes;
import js.lib.Uint8ClampedArray;
import js.lib.Uint8Array;

@:native("GifReader")
#if hxnodejs @:jsRequire("omggif", "GifReader") #end
extern class GifReader
{
	var height : Int;
	var width : Int;

	function new(buf:GifBinary) : Void;
	function decodeAndBlitFrameBGRA(frame_num:Int, pixels:EitherType<Array<Int>, EitherType<Uint8Array, Uint8ClampedArray>>) : Void;
	function decodeAndBlitFrameRGBA(frame_num:Int, pixels:EitherType<Array<Int>, EitherType<Uint8Array, Uint8ClampedArray>>) : Void;
	function frameInfo(frame_num:Int) : Frame;
	function loopCount() : Int;
	function numFrames() : Int;

    @:access(haxe.io.Bytes.b)
    static inline function fromBytes(bytes:Bytes)
    {
        return new GifReader(bytes.b); // `b` is `Uint8Array`
    }
}
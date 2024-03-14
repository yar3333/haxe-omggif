package js.omggif;

import js.lib.Uint8ClampedArray;
import js.lib.Uint8Array;
import haxe.extern.EitherType;

typedef GifBinary = EitherType<Array<Int>, EitherType<Uint8Array, Uint8ClampedArray>>;

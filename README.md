# haxe externs for `omggif` library #

Reader and writer for GIF images.

Original library: https://github.com/deanm/omggif/
Typescript definitions: https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/omggif/


## Install

### if you prefer to use building system like webpack
```shell
npm install omggif
```
In haxe code `hxnodejs` must be defined (use `hxnodejs` library or define that by `-D` compiler switch).

### if you want to use library in html page directrly
Load js library by any way:
```html
    <script src="omggif.js"></script>
```
Directly use `js.omggif.*` classes in your haxe code.


## Using

### read GIF
```haxe
final gif = GifReader.fromBytes(catGifAsBytes);
trace("width =" + gif.width);
trace("height = " + gif.height);
trace("numFrames = " + gif.numFrames());
trace("loopCount = " + gif.loopCount()); // 0 = infinity

var data = new Uint8Array(gif.width * gif.height * 4);
gif.decodeAndBlitFrameRGBA(0, data); // read frame 0 as RGBA values
```

### generate GIF
```haxe
final width = 2;
final height = 2;

final buffer = new Array<Int>();

final gif = new GifWriter(buffer, width, height, { palette: [0xff0000, 0x0000ff] });
gif.addFrame(0, 0, width, height, [0, 1, 1, 0]); // position, size and pixel data (palette indexes)
final bytesCount = gif.end();

trace("bytesCount = " + bytesCount);
```

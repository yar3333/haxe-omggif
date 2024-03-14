import haxe.crypto.Base64;
import js.lib.Uint8Array;
import js.omggif.GifReader;
import js.omggif.GifWriter;
import utest.Assert;

class Test extends utest.Test
{
	public function testReader()
    {
        final catGifAsBase64 = MacroTools.embedFile("../bin/cat.gif");
        final catGifAsBytes = Base64.decode(catGifAsBase64);

        final gif = GifReader.fromBytes(catGifAsBytes);
        Assert.equals(400, gif.width);
        Assert.equals(400, gif.height);
        Assert.equals(12, gif.numFrames());
        Assert.equals(0, gif.loopCount());

        final data = new Uint8Array(gif.width * gif.height * 4);
        gif.decodeAndBlitFrameRGBA(0, data);
    }

    public function testWriterForArray()
    {
        final width = 2;
        final height = 2;
        
        final buffer = new Array<Int>();
		
        final gif = new GifWriter(buffer, width, height, { palette: [0xff0000, 0x0000ff] });
        gif.addFrame(0, 0, width, height, [0, 1, 1, 0]);
        
        final bytesCount = gif.end();
        Assert.equals(36, bytesCount);

        new GifReader(buffer);
    }

    public function testWriterForUint8Array()
    {
        final width = 2;
        final height = 2;
        final frames = 1;
        
        final buffer = new Uint8Array(20 + 256 + width * height * frames * 2); // empirical formula to calculate max gif size
		
        final gif = new GifWriter(buffer, 2, 2, { palette: [0xff0000, 0x0000ff] });
        gif.addFrame(0, 0, 2, 2, [0, 1, 1, 0]);
        
        final bytesCount = gif.end();
        Assert.equals(36, bytesCount);

        new GifReader(buffer);
    }
}

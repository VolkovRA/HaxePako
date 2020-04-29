package pako;

/**
 * Zlib port to javascript from C, very fast!
 * 
 * Why pako is cool:
 * * Almost as fast in modern JS engines as C implementation. (See benchmarks)
 * * Works in browsers, you can browserify any separate component.
 * * Chunking support for big blobs.
 * * Results are binary equal to well known zlib. (Now contains ported zlib v1.2.8)
 * 
 * This project was done to understand how fast JS can be and is it necessary to develop
 * native C modules for CPU-intensive tasks. Enjoy the result!
 * 
 * @see Documentation: http://nodeca.github.io/pako/
 * @see GitHub: https://github.com/nodeca/pako
 * @see npm: https://www.npmjs.com/package/pako
 */
@:native("pako")
extern class Pako
{
    /**
     * Compress `data` with deflate algorithm and `options`.
     * 
     * Supported options are:
     * * level
     * * windowBits
     * * memLevel
     * * strategy
     * * dictionary
     * 
     * Sugar (options):
     * * raw (Boolean) - Say that we work with raw stream, if you don't wish to specify negative windowBits implicitly.
     * * to (String) - If equal to 'string', then result will be "binary string". (Each char code [0..255])
     * 
     * ```
     * var data = new Uint8Array([1,2,3,4,5,6,7,8,9]);
     * trace(Pako.deflate(data));
     * ```
     * @param data Input data to compress.
     * @param options zlib Deflate options. 
     * @return Compressed data.
     * @see Doc: http://nodeca.github.io/pako/#deflate
     */
    static public function deflate(data:Chunk, ?options:Options):Chunk;

    /**
     * The same as `Pako.deflate()`, but creates raw data, without wrapper (header and adler32 crc).
     * @param data Input data to compress.
     * @param options zlib Deflate options. 
     * @return Compressed data.
     * @see Doc: http://nodeca.github.io/pako/#deflateRaw
     */
    static public function deflateRaw(data:Chunk, ?options:Options):Chunk;

    /**
     * The same as `Pako.deflate()`, but create gzip wrapper instead of deflate one.
     * @param data Input data to compress.
     * @param options zlib Deflate options. 
     * @return Compressed data.
     * @see Doc: http://nodeca.github.io/pako/#gzip
     */
    static public function gzip(data:Chunk, ?options:Options):Chunk;

    /**
     * Decompress `data` with inflate/ungzip and `options`. Autodetect format via wrapper header by default.
     * That's why we don't provide separate `ungzip` method.
     * 
     * Supported options are:
     * * windowBits
     * 
     * Sugar (options):
     * * raw (Boolean) - Say that we work with raw stream, if you don't wish to specify negative windowBits implicitly.
     * * to (String) - If equal to 'string', then result will be converted from utf8 to utf16 (javascript) string.
     * When string output requested, chunk length can differ from `chunkSize`, depending on content.
     * 
     * ```
     * var input = Pako.deflate([1,2,3,4,5,6,7,8,9]);
     * try {
     *   output = Pako.inflate(input);
     * }
     * catch (err)
     *   trace(err);
     * }
     * ```
     * @param data Input data to decompress.
     * @param options zlib Inflate options.
     * @return Decompressed data.
     * @see Doc: http://nodeca.github.io/pako/#inflate
     */
    static public function inflate(data:Chunk, ?options:Options):Chunk;

    /**
     * The same as `Pako.inflate()`, but creates raw data, without wrapper (header and adler32 crc).
     * @param data Input data to decompress.
     * @param options zlib Inflate options.
     * @return Decompressed data.
     * @see Doc: http://nodeca.github.io/pako/#inflateRaw
     */
    static public function inflateRaw(data:Chunk, ?options:Options):Chunk;

    /**
     * Just shortcut to `Pako.inflate()`, because it autodetects format by header.content. Done for convenience.
     * @param data Input data to decompress.
     * @param options Inflate options.
     * @return Decompressed data.
     * @see Doc: http://nodeca.github.io/pako/#ungzip
     */
    static public function ungzip(data:Chunk, ?options:Options):Chunk;
}
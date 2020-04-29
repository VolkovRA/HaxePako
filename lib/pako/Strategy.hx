package pako;

/**
 * Compression strategy.
 * 
 * The strategy parameter is used to tune the compression algorithm. Use the values:
 * * `DEFAULT_STRATEGY` - For normal data.
 * * `FILTERED` - For data produced by a filter. (Or predictor)
 * * `HUFFMAN_ONLY` - To force Huffman encoding only. (No string match)
 * * `RLE` - To limit match distances to one. (Run-length encoding)
 * * `FIXED` - Prevents the use of dynamic Huffman codes.
 * 
 * Filtered data consists mostly of small values with a somewhat random distribution.
 * In this case, the compression algorithm is tuned to compress them better. The effect of `FILTERED` is to
 * force more Huffman coding and less string matching. it is somewhat intermediate between `DEFAULT_STRATEGY`
 * and `HUFFMAN_ONLY`. `RLE` is designed to be almost as fast as `HUFFMAN_ONLY`, but give better compression
 * for PNG image data. The strategy parameter only affects the compression ratio but not the correctness of
 * the compressed output even if it is not set appropriately. `FIXED` prevents the use of dynamic Huffman
 * codes, allowing for a simpler decoder for special applications.
 * 
 * @see Documentation zlib: http://zlib.net/manual.html#Advanced
 */
@:enum abstract Strategy(Int) to Int
{
    /**
     * Normal data.
     */
    var DEFAULT_STRATEGY = 0;

    /**
     * Data produced by a filter. (Or predictor)
     */
    var FILTERED = 1;

    /**
     * Force Huffman encoding only. (No string match)
     */
    var HUFFMAN_ONLY = 2;

    /**
     * The limit match distances to one. (Run-length encoding)
     */
    var RLE = 3;

    /**
     * Prevents the use of dynamic Huffman codes.
     */
    var FIXED = 4;
}
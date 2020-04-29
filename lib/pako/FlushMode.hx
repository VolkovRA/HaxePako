package pako;

/**
 * Flush mode values.
 * @see Documentation zlib: http://zlib.net/manual.html#Advanced
 */
@:enum abstract FlushMode(Int) to Int
{  
    /**
     * Normal parameter of flush.
     * Allows the deflate to decide how much data to accumulate before producing output, in order to maximize compression.
     */
    var NO_FLUSH = 0;

    /**
     * All pending output is flushed to the output buffer, but the output is not aligned to a byte boundary.
     * 
     * All of the input data so far will be available to the decompressor, as for `SYNC_FLUSH`.
     * This completes the current deflate block and follows it with an empty fixed codes block that is 10 bits long.
     * This assures that enough bytes are output in order for the decompressor to finish the block before the empty fixed codes block.
     */
    var PARTIAL_FLUSH = 1;

    /**
     * All pending output is flushed to the output buffer and the output is aligned on a byte boundary,
     * so that the decompressor can get all input data available so far.
     */
    var SYNC_FLUSH = 2;

    /**
     * All output is flushed as with `SYNC_FLUSH`, and the compression state is reset so that decompression
     * can restart from this point if previous compressed data has been damaged or if random access is desired.
     * 
     * Using `FULL_FLUSH` too often can **seriously degrade** compression.
     */
    var FULL_FLUSH = 3;

    /**
     * Pending input is processed, pending output is flushed and deflate returns with `STREAM_END` if there was enough output space.
     */
    var FINISH = 4;

    /**
     * A deflate block is completed and emitted, as for `SYNC_FLUSH`, but the output is not aligned on a byte
     * boundary, and up to seven bits of the current block are held to be written as the next byte after the
     * next deflate block is completed. In this case, the decompressor may not be provided enough bits at this
     * point in order to complete decompression of the data provided so far to the compressor. It may need to
     * wait for the next block to be emitted.
     * 
     * This is for **advanced applications** that need to control the emission of deflate blocks.
     */
    var BLOCK = 5;

    /**
     * The option behaves as `BLOCK` does, but it also returns when the end of each deflate block header is reached,
     * before any actual data in that block is decoded. This allows the caller to determine the length of the deflate
     * block header for later use in random access within a deflate block. 256 is added to the value of strm->data_type
     * when inflate() returns immediately after reaching the end of the deflate block header.
     */
    var TREES = 6;
}
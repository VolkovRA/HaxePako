package pako;

/**
 * Return codes for the compression/decompression functions.
 * Negative values are errors, positive values are used for special but normal events.
 * @see Documentation zlib: http://zlib.net/manual.html#Advanced
 */
@:enum abstract StatusCode(Int) to Int
{  
    var OK              = 0;
    var STREAM_END      = 1;
    var NEED_DICT       = 2;
    var ERRNO           = -1;
    var STREAM_ERROR    = -2;
    var DATA_ERROR      = -3;
    var MEM_ERROR       = -4;
    var BUF_ERROR       = -5;
    var VERSION_ERROR   = -6;
}
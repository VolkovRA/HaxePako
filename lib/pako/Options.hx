package pako;

import js.lib.ArrayBuffer;
import haxe.extern.EitherType;

/**
 * The specified params supported to compressing.
 * Throws exception on bad params.
 * @see Documentation zlib: http://zlib.net/manual.html#Advanced
 */
typedef Options = 
{
    /**
     * Compression level. (0-9)
     * 
     * Possible values:
     * * `0` - No compression.
     * * `1` - Low compression, best speed.
     * * `9` - Best compression, low speed.
     * 
     * Default `-1` (Default compression)
     */
    @:optional var level:Int;

    /**
     * The base two logarithm of the window size (the size of the history buffer). (0-15)
     * 
     * It should be in the range 8..15 for this version of the library. Larger values of this parameter result in
     * better compression at the expense of memory usage. The default value is 15 if deflateInit is used instead.
     * 
     * Default `15`
     */
    @:optional var windowBits:Int;

    /**
     * The memLevel parameter specifies how much memory should be allocated for the internal compression state. (1-9)
     * 
     * Possible values:
     * * `1` - Uses minimum memory but is slow and reduces compression ratio.
     * * `9` - Uses maximum memory for optimal speed.
     * 
     * The default value is 8. See zconf.h for total memory usage as a function of windowBits and memLevel.
     * 
     * Default `8`
     */
    @:optional var memLevel:Int;

    /**
     * Compression strategy.
     * 
     * Default `Strategy.DEFAULT_STRATEGY`
     */
    @:optional var strategy:Strategy;

    /**
     * The dictionary should consist of strings (byte sequences) that are likely to be encountered later in the
     * data to be compressed, with the most commonly used strings preferably put towards the end of the dictionary.
     * Using a dictionary is most useful when the data to be compressed is short and can be predicted with good
     * accuracy; the data can then be compressed better than with the default empty dictionary.
     */
    @:optional var dictionary:EitherType<String, ArrayBuffer>;



    ////////////////////////////////////////////////
    //   ADDITIONAL OPTIONS, FOR INTERNAL NEEDS   //
    ////////////////////////////////////////////////

    /**
     * Size of generated data chunks. (16K by default)
     * 
     * Default `16384`
     */
    @:optional var chunkSize:Int;

    /**
     * Do raw deflate.
     */
    @:optional var raw:Bool;

    /**
     * Create gzip wrapper.
     */
    @:optional var gzip:Bool;

    /**
     * If equal to 'string', then result will be "binary string" (each char code [0..255])
     */
    @:optional var to:String;

    /**
     * Custom header for gzip.
     */
    @:optional var header:GZIPHeader;
}

/**
 * Custom gzip headers.
 */
typedef GZIPHeader = 
{
    /**
     * True if compressed data believed to be text.
     */
    @:optional var text:Bool;

    /**
     * Modification time, unix timestamp.
     */
    @:optional var time:Float;

    /**
     * Operation system code.
     */
    @:optional var os:Int;

    /**
     * Array of bytes with extra data. (Max 65536)
     */
    @:optional var extra:Array<Int>;
    
    /**
     * File name. (Binary string)
     */
    @:optional var name:String;

    /**
     * Comment. (Binary string)
     */
    @:optional var comment:String;

    /**
     * True if header crc should be added.
     */
    @:optional var hcrc:Bool;
}
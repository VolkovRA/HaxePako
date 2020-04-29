package pako;

import js.lib.ArrayBuffer;
import js.lib.Uint8Array;
import haxe.extern.EitherType;

/**
 * Binary data.
 */
typedef Chunk = EitherType<EitherType<ArrayBuffer, Uint8Array>, EitherType<Array<Int>, String>>;
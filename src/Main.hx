package;

import pako.*;

class Main
{
	static function main()
	{
		trace(Pako);
		trace(Deflate);
		trace(Inflate);
		trace(FlushMode.NO_FLUSH);
		trace(StatusCode.BUF_ERROR);
		trace(Strategy.HUFFMAN_ONLY);
	}
}
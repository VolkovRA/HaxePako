# Haxe externs for pako

Description
------------------------------

The Haxe high quality extern definitions for pako. Pako is super fast and ease JavaScript zip library.
See [official website](http://nodeca.github.io/pako/ "Pako is cool!") for more about pako.

How to use
------------------------------

```
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
```

Adding library
------------------------------

1. Install haxelib so that you can use the Haxe libraries.
2. Run the command in the terminal to install the Pako externs library globally on your local machine:
```
haxelib git Pako https://github.com/VolkovRA/HaxePako master
```
Command syntax:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Add the Pako library to your project to use it in the code. If you are using HaxeDevelop, then simply add the entry to the .hxproj file:
```
<haxelib>
	<library name="Pako" />
</haxelib>
```

See more information:
 * [Documentation Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Documentation HaxeDevelop](https://haxedevelop.org/configure-haxe.html "Configure Haxe")
 * [Documentation Haxe compiler](https://haxe.org/manual/compiler-usage-hxml.html "Configure compile.hxml")
 * [WebPackager](https://github.com/VolkovRA/WebPackager "Package web assets")
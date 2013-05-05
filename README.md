EAT
===

Easy-Alt Typography, Version 1.0.


Description
-----------

Easily enter proper typographical symbols and characters, anywhere.


Purpose
-------

To make it easy for Windows users to type the same special characters that are
readily available on Mac OS X, but which are only available to Windows users
via obscure ALT Num-pad codes.


Installation
------------

1. Install [AutoHotKey][] (for Windows)
    * You may try [IronAHK][] if you are on Linux, but no guarantees.
2. Run the `EasyAlt.ahk` script with AutoHotKey.
    * (Just double-click the file.)
3. Press ALT + {any key you want}
    * Seriously, try it out!


Usage
-----

Efforts have been made to implement and consolidate the contents of these two
pages. Consulting them will be of help:

* <http://www.forlang.wsu.edu/help/keyboards2.asp>
* <http://www.nouilles.info/keyboard_shortcuts.html>

**One notable difference from the actual Mac OS X implementation:**

* Mac typographic hotkeys are based on the *letter accent,* followed by the
  *letter to be accented.*
* Easy-Alt hotkeys are based only on the *letter to be accented.*
* **Hit hotkeys multiple times to cycle through the options.**
* The reason for this is that Windows does not support pre-keypress modifiers
  (e.g. first `OPTION+e`, *then* `e`), only on-keypress modifiers (i.e. the
  standard `Ctrl`, `Alt`, `Shift`, `Win`, etc.)
* Some kind of “state” could probably be hacked up in AutoHotKey to remedy this
  and make behavior accross both platforms more consistent, but
    1. such a design might bring unwanted fragility to the system, and
    2. I don’t know enough AutoHotKey to do such a thing yet. But do feel free
       to contribute if this is something you would like to see!

[AutoHotKey]: http://www.autohotkey.com/
[IronAHK]: http://www.ironahk.net/

**For more detail on usage, see “Rationale” below.**


Rationale
---------

ALT codes are pretty obscure. Proper utilization of them requires, at minimum,
one of four things before they become useful.

1. The ability to use a search engine to find the codes you want (…)
2. Being willing to have `charmap.exe` up-and-running 24/7 (inconvenient…)
3. The ability to memorize random numbers (handy, but dull…)
4. Great knowledge of the [ASCII][] and [Unicode][] standards (getting scary…)

[ASCII]: https://en.wikipedia.org/wiki/ASCII
[Unicode]: https://en.wikipedia.org/wiki/Unicode

For example:

    ALT+130  = é
    ALT+0151 = — (em-dash)
    ALT+0145 = ‘ (opening single quote mark)
    ALT+0146 = ’ (closing single quote mark; apostrophe)
    ALT+0147 = “ (opening double quote marks)
    ALT+0148 = ” (closing double quote marks)

…And many more.

Mac OS X users have a **much** easier time with this sort of thing:

    OPTION+e, e    = é

    OPTION+-       = – (en-dash)
    OPTION+SHIFT+- = — (em-dash)

    OPTION+[       = “ (opening double quote marks)
    OPTION+SHIFT+[ = ” (closing double quote marks)
    OPTION+]       = ‘ (opening single quote mark)
    OPTION+SHIFT+] = ’ (closing single quote mark; apostrophe)

In fact, it’s *so* easy, you’ve learned it before you’ve even realized it:

    if
        OPTION+e, e = é
    then...
        OPTION+e, a = á
        OPTION+e, i = í
        OPTION+e, o = ó
        OPTION+e, u = ú

    if
        OPTION+u, u = ü
    then...
        OPTION+u, a = ä
        OPTION+u, e = ë
        OPTION+u, i = ï
        OPTION+u, o = ö

    if
        OPTION+n, n = ñ
    then...
        OPTION+n, a = ã
        OPTION+n, o = õ

Etc. …Why can’t Windows do this kind of thing again?

Well, now it can.

    ALT+e = é
    ALT+e+e = è
    ALT+e+e+e = ê
    ALT+e+e+e+e = ë
    ALT+e+e+e+e+e = é (cycling!)

    ALT+-       = – (en-dash)
    ALT+SHIFT+- = — (em-dash)

    ALT+[       = “ (opening double quote marks)
    ALT+SHIFT+[ = ” (closing double quote marks)
    ALT+]       = ‘ (opening single quote mark)
    ALT+SHIFT+] = ’ (closing single quote mark; apostrophe)

…and more.

In short,

**Easy-Alt turns your Alt key into a secondary Shift key!**


Motivation
----------

Being bested by a syntax highlighter…

“Typography, quotemarks, bah… that stuff’s for schmucks. UTF-8 in a text file?
Try a browser! That stuff’s something that a parser like [MultiMarkdown][] or
[SmartyPants][] should take care of. We shouldn’t ever need to worry about
paying attention to such trivial—

![Sublime, oh you!](http://content.screencast.com/users/markgollnick/folders/Jing/media/65393dc8-6284-459b-9587-b3d2bb94b4c7/motivation.png)

“…dang.”

[MultiMarkdown]: http://fletcherpenney.net/multimarkdown/
[SmartyPants]: http://daringfireball.net/projects/smartypants/


License
-------

Boost Software License, Version 1.0: <http://www.boost.org/LICENSE_1_0.txt>


Acknowledgments
---------------

* [Dmitry Ivanov][dfcreative], for the (soon closing)
  [windows_typographic_hotkeys][hotkeys] project, and for inspiration.
* Washington State University, for their [Apple Macintosh Keyboards][amk] page.
* Arnold “Noodles” Winkelried, for his [Keyboard Shortcuts][shortcuts] page.

[dfcreative]: https://github.com/dfcreative
[hotkeys]: https://github.com/dfcreative/windows_typographic_hotkeys
[amk]: http://www.forlang.wsu.edu/help/keyboards2.asp
[shortcuts]: http://www.nouilles.info/keyboard_shortcuts.html

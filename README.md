BinDot2Braille
==============

[![Build Status](https://travis-ci.org/aycabta/bindot2braille.svg)](https://travis-ci.org/aycabta/bindot2braille)

You can convert from

    00010000
    00010000
    11111110
    00111000
    00111000
    01101100
    01000100
    00000000

to

    ⠤⣼⡤⠄
    ⠰⠋⠳⠀

.

## text2braille

It's ASCII interactive converter shell.

    $ text2braille
    YAPPY> hi
    ⣆⠀⢐⠀
    ⠇⠇⠸⠀
    YAPPY> YAPPY
    ⢆⠆⡔⡄⡖⡄⡖⡄⢆⠆
    ⠸⠀⠏⠇⠏⠀⠏⠀⠸⠀
    YAPPY> BAD BOY
    ⣖⠄⡔⡄⡖⡄⠀⠀⣖⠄⡔⡄⢆⠆
    ⠧⠃⠏⠇⠧⠃⠀⠀⠧⠃⠣⠃⠸⠀
    YAPPY> I have a pen.
    ⢲⠂⠀⠀⣆⠀⢀⡀⡀⡀⢀⡀⠀⠀⢀⡀⠀⠀⣀⠀⢀⡀⣀⠀⠀⠀
    ⠼⠄⠀⠀⠇⠇⠣⠇⠗⠁⠫⠅⠀⠀⠣⠇⠀⠀⡧⠃⠫⠅⠇⠇⠠⠀
    YAPPY> quit

Thanks, [Misaki font](http://www.geocities.jp/littlimi/misaki.htm).


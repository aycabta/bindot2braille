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

## usage

Install;

`gem install bindot2braille`

and use:

```ruby
require 'bindot2braille'

char = BinDot2Braille.convert(
  4, 8,
  '0000'+ # This is 'A'
  '0100'+
  '1010'+
  '1010'+
  '1110'+
  '1010'+
  '1010'+
  '0000'
)

# `char` has 2 dimensional array, graphical braille matrix.
puts char.map{ |line| line.join }.join("\n")
```

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


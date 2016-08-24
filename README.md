BinDot2BrailleGraph
===================

[![Build Status](https://travis-ci.org/aycabta/bindot2braillegraph.svg)](https://travis-ci.org/aycabta/bindot2braillegraph)

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

`gem install bindot2braillegraph`

and use:

```ruby
require 'bindot2braillegraph'

# BinDot2BrailleGraph.convert(
#   width, height,
#   zero_or_one_binary_data_of_one_dimensional_string
# )
char = BinDot2BrailleGraph.convert(
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

# `char` what was returned has 2 dimensional array, braille graph matrix.
puts char.map{ |line| line.join }.join("\n")
```

## text2braillegraph

It's ASCII font converter, can process STDIN and interactive shell.

STDIN:

    $ printf "happy kiss\n*festival*" | text2braillegraph
    ⣆⠀⢀⡀⣀⠀⣀⠀⡀⡀⠀⠀⡆⡀⢐⠀⢀⡀⢀⡀
    ⠇⠇⠣⠇⡧⠃⡧⠃⣑⠇⠀⠀⠏⠆⠸⠀⠽⠂⠽⠂
    ⢴⠄⣰⡂⢀⡀⢀⡀⣠⡀⢐⠀⡀⡀⢀⡀⢲⠀⢴⠄
    ⠁⠁⠸⠀⠫⠅⠽⠂⠸⠄⠸⠀⠗⠁⠣⠇⠸⠀⠁⠁

Interactive shell:

    $ text2braillegraph
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


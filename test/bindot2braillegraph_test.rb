require 'test_helper'
require 'bindot2braillegraph'
require 'bindot2braillegraph/version'

describe BinDot2BrailleGraph do
  describe "version number" do
    it "must be had" do
      refute_nil(::BinDot2BrailleGraph::VERSION)
    end
  end

  describe "binary dot to braille graph" do
    it "convert 2x4" do
      assert_equal(
        BinDot2BrailleGraph.convert(
          2, 4,
          '01'+
          '00'+
          '10'+
          '11'),
        [['⣌']])
    end
    it "convert 4x8" do
      assert_equal(
        BinDot2BrailleGraph.convert(
          4, 8,
          '0000'+
          '0100'+
          '1010'+
          '1010'+
          '1110'+
          '1010'+
          '1010'+
          '0000'),
        [['⡔', '⡄'],
         ['⠏', '⠇']])
    end
  end
end

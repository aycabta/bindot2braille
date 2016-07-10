require 'test_helper'
require 'bindot2braille'
require 'bindot2braille/version'

describe BinDot2Braille do
  describe "version number" do
    it "must be had" do
      refute_nil(::BinDot2Braille::VERSION)
    end
  end

  describe "when asked about blending possibilities" do
    it "won't say no" do
      assert_equal(
        BinDot2Braille.convert(
          2, 4,
          '01'+
          '00'+
          '10'+
          '11'),
        [['⣌']])
      assert_equal(
        BinDot2Braille.convert(
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

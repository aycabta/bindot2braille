require 'test_helper'
require 'bindot2braillegraph'
require 'bindot2braillegraph/version'
require 'pty'
require 'expect'

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

  describe "text2braillegraph" do
    it "convert STDIN" do
      assert_equal(
        `printf "happy kiss\n*festival*" | exe/text2braillegraph`,
        "⣆⠀⢀⡀⣀⠀⣀⠀⡀⡀⠀⠀⡆⡀⢐⠀⢀⡀⢀⡀\n"+
        "⠇⠇⠣⠇⡧⠃⡧⠃⣑⠇⠀⠀⠏⠆⠸⠀⠽⠂⠽⠂\n"+
        "⢴⠄⣰⡂⢀⡀⢀⡀⣠⡀⢐⠀⡀⡀⢀⡀⢲⠀⢴⠄\n"+
        "⠁⠁⠸⠀⠫⠅⠽⠂⠸⠄⠸⠀⠗⠁⠣⠇⠸⠀⠁⠁\n")
    end
    it "interactive shell" do
      PTY.spawn('exe/text2braillegraph') do |r, w|
        r.expect(/YAPPY> /) { w.puts 'aieee' }
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, 'aieee') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, '⢀⡀⢐⠀⢀⡀⢀⡀⢀⡀') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, '⠣⠇⠸⠀⠫⠅⠫⠅⠫⠅') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].read_nonblock(128), 'YAPPY> ') unless result.nil?
      end
    end
    it "interactive shell with SIGINT" do
      PTY.spawn('exe/text2braillegraph') do |r, w, pid|
        r.expect(/YAPPY> /) { Process.kill("INT", pid) }
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, '^C') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].read_nonblock(128), 'YAPPY> ') unless result.nil?
      end
    end
    it "interactive shell input cancel with SIGINT" do
      PTY.spawn('exe/text2braillegraph') do |r, w, pid|
        r.expect(/YAPPY> /) do
          w.print 'aoo'
        end
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        r.expect(/aoo/) do
          Process.kill("INT", pid)
          result = IO.select([r], [], [], 1)
          assert_equal(result.nil?, false)
          assert_equal(result[0][0].gets.chomp, '^C') unless result.nil?
        end
        r.expect(/YAPPY> /) { w.puts 'aieee' }
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, 'aieee') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, '⢀⡀⢐⠀⢀⡀⢀⡀⢀⡀') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].gets.chomp, '⠣⠇⠸⠀⠫⠅⠫⠅⠫⠅') unless result.nil?
        result = IO.select([r], [], [], 1)
        assert_equal(result.nil?, false)
        assert_equal(result[0][0].read_nonblock(128), 'YAPPY> ') unless result.nil?
      end
    end
  end
end

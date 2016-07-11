
class BinDot2Braille
  LEFT_SHIFT_TABLE = {
    0b00000001 => 7,
    0b00000010 => 4,
    0b00000100 => 1,
    0b00001000 => 3,
    0b00010000 => 0,
    0b00100000 => -3,
    0b01000000 => -5,
    0b10000000 => -7
  }
  num = 0
  @@num_to_braille = {}
  (0..0xF).each do |upper|
    (0..0xF).each do |lower|
      code = (0..7).inject(0) { |code_in_loop, bit_digit|
        mask = 1 << bit_digit
        code_in_loop |= (num & mask) << LEFT_SHIFT_TABLE[mask]
      }
      @@num_to_braille[code] = [(0x2800 + upper * 0x10 + downer)].pack('U*')
      num += 1
    end
  end

  def self.convert(width, height, binary)
    if width % 2 != 0 || height % 4 != 0
      nil
    else
      table = []
      vertical_char_num = height / 4
      horizontal_char_num = width / 2
      (0..(vertical_char_num - 1)).each do |v_pos|
        row = []
        (0..(horizontal_char_num - 1)).each do |h_pos|
          braille_binary =
            binary.slice((v_pos * 4    ) * width + h_pos * 2, 2) +
            binary.slice((v_pos * 4 + 1) * width + h_pos * 2, 2) +
            binary.slice((v_pos * 4 + 2) * width + h_pos * 2, 2) +
            binary.slice((v_pos * 4 + 3) * width + h_pos * 2, 2)
          row << @@num_to_braille[braille_binary.to_i(2)]
        end
        table << row
      end
      table
    end
  end
end


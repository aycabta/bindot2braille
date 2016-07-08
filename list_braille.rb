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
num_to_braille = {}
(0..0xF).each do |upper|
  (0..0xF).each do |downer|
    code = (0..7).inject(0) { |code, bit_digit|
      mask = 1 << bit_digit
      code |= (num & mask) << LEFT_SHIFT_TABLE[mask]
    }
    num_to_braille[code] = [(0x2800 + upper * 0x10 + downer)].pack('U*')
    num += 1
  end
end

(0..7).inject(0) { |code, bit_digit|
  mask = 1 << bit_digit
  puts ((255 & mask) << LEFT_SHIFT_TABLE[mask]).to_s(2)
}

puts "|#{num_to_braille[
('10'+
 '00'+
 '00'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('01'+
 '00'+
 '00'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '10'+
 '00'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '01'+
 '00'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '00'+
 '10'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '00'+
 '01'+
 '00').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '00'+
 '00'+
 '10').to_i(2)
]}|"
puts "|#{num_to_braille[
('00'+
 '00'+
 '00'+
 '01').to_i(2)
]}|"


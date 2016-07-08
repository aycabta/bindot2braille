num = 0
num_to_braille = {}
(0..0xF).each do |upper|
  (0..0xF).each do |downer|
    bit_mapping =
      ((num & 0b00000001) << 7) |
      ((num & 0b00000010) << 5) |
      ((num & 0b00000100) << 3) |
      ((num & 0b00001000) << 1) |
      ((num & 0b00010000) >> 1) |
      ((num & 0b00100000) >> 3) |
      ((num & 0b01000000) >> 5) |
      ((num & 0b10000000) >> 7) |
      0
    num_to_braille[bit_mapping] = [(0x2800 + upper * 0x10 + downer)].pack('U*')
    num += 1
  end
end

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


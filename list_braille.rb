(0..0xF).each do |upper|
  (0..0xF).each do |downer|
    print "#{[(0x2800 + upper * 0x10 + downer)].pack('U*')} "
  end
  puts
end

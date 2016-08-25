#!/usr/bin/env ruby

unless (ARGV.size == 2 && ARGV[0] =~ /0|^[1-9][\d_]*$/ && ARGV[1] =~ /^(0b)?[01]+[01_]*$/)
  abort "USAGE: #{$0} DECIMAL BINARY"
end

decimal = ARGV[0].tr('_','')
binary  = ARGV[1].gsub(/^0b|_/,'')
#decimal =~ /^[+-]?[1-9][\d_]*[^_]$/

def dec2bin decimal # => 10.to_s(2) == 1010
    d = decimal.to_i
    bin_arr = (d == 0) ? [0] : []
    while d > 0 do
      bin_arr.unshift d % 2
      d = d / 2
    end
  return bin_arr.join
end

def bin2dec binary  # => 1010.to_s.to_i(2) == 10
  power = binary.size
  dec = 0
      binary.each_char do |d|
          power -= 1
          dec += d.to_i*2**(power)
      end
  return dec
end

puts "Decimal digit #{decimal} -> #{dec2bin(decimal)}"
puts "Binary  digit #{binary} -> #{bin2dec(binary)}"

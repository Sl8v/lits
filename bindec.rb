#!/usr/bin/env ruby

def usage
  puts "USAGE: ./bindec.rb DECIMAL BINARY"
  abort
end

unless (ARGV.size == 2 && ARGV[0] =~ /0|^[1-9][\d_]*$/ && ARGV[1] =~ /^(0b)?[01]+[_]*$/)
  usage
end

decimal = ARGV[0].tr('_','')
binary  = ARGV[1].gsub('^0b|_','')

#decimal =~ /^[+-]?[1-9][\d_]*[^_]$/
#TODO: work with negative

def dec2bin decimal # => 10.to_s(2) == 1010
  puts "TEST dec2bin method: "
    d = decimal.to_i
    bin_arr = (d == 0) ? [d] : []
    while d > 0 do
      (d % 2 == 0) ? bin_arr.unshift(0) : bin_arr.unshift(1)
      d = d / 2
    end
  return bin_arr.join
end

def bin2dec binary  # => 1010.to_s.to_i(2) == 1
  puts "TEST bin2dec method: "
  power = binary.size
  dec = 0
      binary.each_char do |d|
          power -= 1
          dec += d.to_i*2**(power)
      end
  return dec
end

puts   " Decimal: #{decimal} -> #{dec2bin(decimal)}
\b\b\b\b Binary : #{binary} -> #{bin2dec(binary)}"

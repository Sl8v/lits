#!/usr/bin/env ruby

class Configurator < File

  def self.usage
    abort "USAGE: #{$0} path_to_config_file"
  end

=begin
TriangleS:
square- 2 (2)
square- 3 (3)
square- 4 (4)
CircleS:
=end
config = ARGV[0]
# %W[triangleS circleS rectangleS].each do |array|
#   arr = Array.new
#   arr[0] = ["#{array.capitalize}"]
# end

triangleS  = ["TriangleS:"]
circleS    = ["CircleS:"]
rectangleS = ["RectangleS:"]

triangleS_err  = ["TriangleS:"]
circleS_err    = ["CircleS:"]
rectangleS_err = ["RectangleS:"]

  if self.size?(config) && self.file?(config)
    config_file = self.new config
    config_file.each_with_index  { |line, index|
      index += 1
      #puts "index: #{index+1} for line: #{line}"
      if line.include? ":"
        figure, params = line.split(":").map(&:strip)
        params = params.split(',').map(&:strip)
      else
        #puts "#{index} WRONG figure"
        next
      end

       if figure == 'Triangle'
         if params.size == 3
#          puts "#{index} #{figure} OK"
          triangleS << "square- #{params[0]} (#{index})"
         else
#          puts "#{index} #{figure} BAD"
          triangleS_err << index
         end
       elsif figure == 'Circle'
           if params.size == 1
            circleS << "square- #{params[0]} (#{index})"
           else
            circleS_err << index
           end
       elsif figure == 'Rectangle'
           if params.size == 2
            rectangleS << "square- #{params[0]} (#{index})"
           else
            rectangleS_err << index
           end
         else
           puts "#{index} Unknown figure: #{figure}"
   end
    }
  else
    usage
#puts "bads"
  end
puts triangleS + circleS + rectangleS
puts "ERRORS "*7
puts triangleS_err + circleS_err + rectangleS_err

end

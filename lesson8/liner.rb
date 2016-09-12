#!/usr/bin/env ruby

class Configurator < File

  def self.usage
    abort "USAGE: #{$0} path_to_config_file"
  end

config = ARGV[0]

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
      if line.include? ":"
        figure, params = line.split(":").map(&:strip)
        # puts figure
        # puts params
       #|| params.empty?
      else
        next
      end

      next if params.nil?

      if params.include? ","
        params = params.split(',').map(&:strip)
      end


       if figure.include? 'Triangle'
         if params.size == 3
          triangleS << "square- #{params[0]} (#{index})"
         else
          triangleS_err << index
         end
       elsif figure.include? 'Circle'
           if params.size == 1
            circleS << "square- #{params[0]} (#{index})"
           else
            circleS_err << index
           end
       elsif figure.include? 'Rectangle'
           if params.size == 2
            rectangleS << "square- #{params[0]} (#{index})"
           else
            rectangleS_err << index
           end
         else
           #puts "#{index} Unknown figure: #{figure}"
     end
    }
  else
    usage
  end

  def valid_figure figure, figure_sides, result_file, error_file
  end


puts triangleS + circleS + rectangleS

out = File.new("result.txt", "w+")
out.puts triangleS + circleS + rectangleS
out.close

puts "\n" + "ERRORS "*7 + "\n\n"
puts triangleS_err + circleS_err + rectangleS_err

out = File.new("errors.log", "w+")
out.puts triangleS_err + circleS_err + rectangleS_err
out.close


end

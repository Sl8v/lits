#!/usr/bin/env ruby

############ class AREA  #################

class Area
#attr_reader :area

PI = Math::PI

 class << self

   def for_humans
     puts "#{@figure} area raw value is: #{@area.to_s}"
     puts "Rounded value is: #{@area.round.to_s}"
   end

    def triangle side_a, side_b, side_c
        semiperimeter = ((side_a + side_b + side_c)/2)
        @figure = __method__
        @area = Math.sqrt(semiperimeter * (semiperimeter - side_a) * (semiperimeter - side_b) * (semiperimeter - side_c))
        #for_humans
        @area.round
    end

    def circle radius
       @figure = __method__
       @area = PI*radius**2
       #for_humans
       @area.round
    end

    def rectangle side_a, side_b
      @figure = __method__
      @area = side_a*side_b
      #for_humans
      @area.round
    end
  end


######### for NEW object
    def initialize (*sides_num)
      @sides = sides_num.map(&:to_f)
      @sides_total = @sides.size
    end

    def circle?
      @sides_total == 1
    end

    def rectangle?
      @sides_total == 2
    end

    def triangle?
      @sides_total == 3
    end

    def radius
      radius = @sides[0] if circle?
    end

    def triangle #side_a, side_b, side_c
      return "is not triangle" unless triangle?
      side_a, side_b, side_c  = @sides
      semiperimeter = ((side_a + side_b + side_c)/2)
      @figure = __method__
      @area = Math.sqrt(semiperimeter * (semiperimeter - side_a) * (semiperimeter - side_b) * (semiperimeter - side_c))
      for_humans
      @area.round
    end

    def circle #radius
       return "is not circle" unless circle?
       @figure = __method__
       @area = PI*radius**2
       for_humans
       @area.round
    end

    def rectangle # => side_a , side_b
      return "is not rectangle" unless rectangle?
      side_a, side_b = @sides
      @figure = __method__
      @area = side_a*side_b
      for_humans
      @area.round
    end

    private

    def for_humans
      puts "#{@figure} area raw value is: #{@area.to_s}"
      puts "Rounded value is: #{@area.round.to_s}"
    end
=end

end

#### class Preparator #################
class Preparator < File

  def self.usage
    abort "USAGE: #{$0} path_to_config_file"
  end

  config = ARGV[0]

  #log file templates
  triangleS  = ["TriangleS:"]
  circleS    = ["CircleS:"]
  rectangleS = ["RectangleS:"]

  triangleS_err  = ["TriangleS:"]
  circleS_err    = ["CircleS:"]
  rectangleS_err = ["RectangleS:"]

  # check that file is valid than brake to pieces
  if size?(config) && file?(config)
    config_file = new config
    config_file.each_with_index  { |line, index|
      index += 1
      if line.include? ":"
        figure, params = line.split(":").map(&:strip)
      else
        next
      end

      next if params.nil?

      if params.include? ","
        params = params.split(',').map(&:strip)
      end

#parsing with external calls. TODO: rewrite to method!!!
       if figure.include? 'Triangle'
         if params.size == 3
          area = Area.triangle( params[0].to_f, params[1].to_f, params[2].to_f )
          triangleS << "square- #{area} (#{index})"
         else
          triangleS_err << index
         end
       elsif figure.include? 'Circle'
           if params.size == 1
             area = Area.circle( params[0].to_f)
            circleS << "square- #{area} (#{index})"
           else
            circleS_err << index
           end
       elsif figure.include? 'Rectangle'
           if params.size == 2
             area = Area.rectangle( params[0].to_f, params[1].to_f)
            rectangleS << "square- #{area} (#{index})"
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

  def self.write_files output_file, *output_data
    out = File.new output_file, 'w+'
    out.puts output_data
    out.close
  end

  write_files 'result.txt', triangleS,     circleS,     rectangleS
  write_files 'errors.log', triangleS_err, circleS_err, rectangleS_err

end

#####

Preparator.new(ARGV[0])

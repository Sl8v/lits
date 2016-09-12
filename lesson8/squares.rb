#!/usr/bin/env ruby


class Area
#attr_reader :area

PI = Math::PI


 class << self
    def initialize (*sides_num)
      @sides = sides_num.map(&:to_f)
      @sides_total = @sides.size
    end

    def for_humans
      puts "#{@figure} area raw value is: " + @area.to_s
      puts 'Rounded value is: '             + @area.round.to_s
    end

    def triangle first, second, third
        semiperimeter = ((first + second + third)/2)
        @figure = __method__
        @area = Math.sqrt(semiperimeter * (semiperimeter - first) * (semiperimeter - second) * (semiperimeter - third))
        for_humans
        @area.round
    end

    def circle radius
       @figure = __method__
       @area = PI*radius**2
       for_humans
       @area.round
    end

    def rectangle side_a, side_b
      @figure = __method__
      @area = side_a*side_b
      for_humans
      @area.round
    end

end

#### for NEW object
    def initialize (*sides_num)
      @sides = sides_num.map(&:to_f)
      @sides_total = @sides.size
    end


    def is_circle?
      @sides_total == 1
    end

    def is_rectangle?
      @sides_total == 2
    end

    def is_triangle?
      @sides_total == 3
    end

    def radius
      radius = @sides[0] if is_circle?
    end

    def triangle #first, second, third
      return "is not triangle" unless is_triangle?
      first, second, third  = @sides
      semiperimeter = ((first + second + third)/2)
      @figure = __method__
      @area = Math.sqrt(semiperimeter * (semiperimeter - first) * (semiperimeter - second) * (semiperimeter - third))
      for_humans
      @area.round
    end

    def circle #radius
       return "is not circle" unless is_circle?
       @figure = __method__
       @area = PI*radius**2
       for_humans
       @area.round
    end

    def rectangle
      return "is not rectangle" unless is_rectangle?
      side_a, side_b = @sides
      @figure = __method__
      @area = side_a*side_b
      for_humans
      @area.round
    end

    private

    def for_humans
      puts "#{@figure} area raw value is: " + @area.to_s
      puts 'Rounded value is: '             + @area.round.to_s
    end

end

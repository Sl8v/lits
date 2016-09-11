#!/usr/bin/env ruby


=begin
config:

Circle: 1, 2
Rectangle: 2,2
Triangle: 2,3,3
=end

class Preparator
end



class Area

PI = Math::PI

    def triangle first, second, third
      first, second, third  = first.to_f, second.to_f,  third.to_f # TODO: move to_f in Preparator
      semiperimeter = ((first + second + third)/2)
      @figure = __method__
      @area = Math.sqrt(semiperimeter * (semiperimeter - first) * (semiperimeter - second) * (semiperimeter - third))
      for_humans
      @area.round
    end

    def circle radius
       radius = radius.to_f
       @figure = __method__
       @area = PI*radius**2
       for_humans
       @area.round
    end

    def rectangle side_a, side_b
      side_a, side_b = side_a.to_f, side_b.to_f
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

#private



#puts triangle_heron( 3, 3, 3) # => 4;  5,5,5 => 11

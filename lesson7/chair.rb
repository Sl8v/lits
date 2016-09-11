class Chair

	@@color = 'yellow'
	@stand_please = 'uhuh'
	@legs = 4

	def initialize (legs_num, col='yellow')
    @legs = legs_num
		color= col
	end

	def stand_please
		puts 'Ooh I`m standing.... Hello...!'
	end

  def legs=  qty
    @legs = qty + legs
  end

  def legs
    return @legs
  end
end


smth= Chair.new(3)

 smth.legs = 5

puts smth.legs
#puts smth.color
smth.stand_please

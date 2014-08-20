class Shape

	def area
	  raise "Abstract method area invoked."
	end

	def perimeter
	  raise "Abstract method perimeter invoked."
	end

	def volume
	  raise "Abstract method volume invoked."
	end

	def shapeStats
	  stats = {}	
	  stats[:area] = area
	  stats[:perimeter] = perimeter
	  stats[:volume] = volume
	  stats
	end
end

class Square < Shape

	def initialize(options={})
	  @side_length = options[:side_length]
	  @side_length_unit = options[:side_length_unit]
	end

	def area
	  @side_length ** 2
	end

	def perimeter
	  @side_length * 4
	end

	def volume
	  nil
	end

end

square = Square.new(options = {side_length: 14, side_length_unit: :cm })
p square.shapeStats
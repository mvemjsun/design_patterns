class SimpleHaircut

	def initialize
		puts "#{self.class} Initialized"
	end

	def cut_hair
		puts "Giving you a SimpleHaircut"
	end

end

class HaircutDecorator
	def initialize(hairCutType)
		@hairCutType = hairCutType
		puts "#{self.class} Initialized"
	end

	def cut_hair
		@hairCutType.cut_hair
	end
end

class HaircutWithShampoo < HaircutDecorator
	def initialize(hairCutType)
		@hairCutType = hairCutType
		puts "#{self.class} Initialized"
	end

	def cut_hair
		@hairCutType.cut_hair
		puts "Giving you a #{self.class}"
	end	

end

class HaircutWithColour < HaircutDecorator
	def initialize(hairCutType)
		@hairCutType = hairCutType
		puts "#{self.class} Initialized"
	end

	def cut_hair
		@hairCutType.cut_hair
		puts "Giving you a #{self.class}"
	end	
end

class HaircutWithMohicanStyle < HaircutDecorator
	attr_reader :style

	def initialize(hairCutType)
		@hairCutType = hairCutType
		@style = :mohican
		puts "#{self.class} Initialized"
	end

	def cut_hair
		@hairCutType.cut_hair
		puts "Giving you a #{self.class}"
	end		
end

#
# Example Usages
#

hairCut1 = HaircutWithShampoo.new(SimpleHaircut.new)
hairCut1.cut_hair
puts
hairCut2 = HaircutWithShampoo.new(HaircutWithColour.new(SimpleHaircut.new))
hairCut2.cut_hair
puts
hairCut3 = HaircutWithMohicanStyle.new(HaircutWithShampoo.new(HaircutWithColour.new(SimpleHaircut.new)))
hairCut3.cut_hair
puts
hairCut4 = HaircutWithMohicanStyle.new((SimpleHaircut.new))
hairCut4.cut_hair
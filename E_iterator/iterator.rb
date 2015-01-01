class Planet

	attr_reader :name, :distance, :size

	def initialize(name,distance,size)
		@name = name
		@distance = distance
		@size=size
	end

	def <=>(other_planet)
		@size <=> other_planet.size
	end
end

class Galaxy

	include Enumerable

	def initialize
		@planets = []
	end

	def each(&block)
		@planets.each(&block)
	end

	def add_planet(planet)
		@planets << planet
	end
end

#
# Example usage
#
mercury = Planet.new(:mercury,36000000,4878 )
venus = Planet.new(:venus,67000000,12104)
earth = Planet.new(:earth,92960000,12756)
mars = Planet.new(:mars,141700000,6794)
jupiter = Planet.new(:jupiter,778369000,142948)
saturn = Planet.new(:saturn,888750000,120536)
uranus = Planet.new(:uranus,1783744300 ,120536)
neptune = Planet.new(:neptune,2797770000,49532)

galaxy = Galaxy.new
galaxy.add_planet(mercury)
galaxy.add_planet(venus)
galaxy.add_planet(earth)
galaxy.add_planet(mars)
galaxy.add_planet(jupiter)
galaxy.add_planet(saturn)
galaxy.add_planet(uranus)
galaxy.add_planet(neptune)

galaxy.each {|planet| p planet.name}

#
# Additional methods offered by Enumerable are `any?` and `all?`
#
# Any planet has size > 14000 , true
p galaxy.any? {|planet| planet.size > 14000}

# All elements satisfy the condition, false
p galaxy.all? {|planet| planet.size > 14000}
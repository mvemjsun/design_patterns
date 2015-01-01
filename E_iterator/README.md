## Iterator Design pattern

There are two type of iterators in ruby, the first one is called an `external` iterator and the second one which is more common in ruby is called the `internal` iterator. External iterators can be controlled more by is but internal iterators yield the result of iteration to a block one by one without us being able to control it.

#### An External iterator class for an Array could look like

```ruby
class ArrayIterator
	
	attr_reader :index

	def initialize(array)
		@array = array
		@index = 0
	end

	def next_item
		if @index < @array.length - 1
		  @array[@index]
		  @index += 1
		end
	end

	def has_next?
		@index < @array.length  
	end

	def item
		@array[@index]
	end
end
```

So with the above class in place we would have an example usage as below

```ruby
arr = [2,3,89,8,14]
itr = ArrayIterator.new(arr)
while itr.has_next?
	p "Array element at position #{itr.index} is  #{itr.item}"
end
```

#### An internal iterator in ruby looks like

```ruby
arr = [1,67,9,34,99,23,5,11]
arr.each {|x| p "Array item is #{x}"}

or in reverse

arr.reverse_each {|x| p "Array item is #{x}"}
```

### The Enumerable module

The `Enumerable` module offers us an easier way to implement the iterator behaviour into our classes, all we need to do is to include the module into out classes. The only two things that we need to do is to provide a sensible implementation of the `each` and the `<=>` methods. The first is to iterate and the second is to compare to Enumerable objects.

### Example, 

```ruby
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
```

Usage might look like

```ruby
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

```

Sample output

```
:mercury
:venus
:earth
:mars
:jupiter
:saturn
:uranus
:neptune
true
false
```

[Back] (https://github.com/mvemjsun/design_patterns/blob/master/README.md)
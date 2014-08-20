## Template Design pattern

 A template method design pattern is one of the most simple design pattern to understand and implement. The main idea here is to provide a template class that acts as a template to all the inheriting sublclasses. The template class is designed as an "abstract class" (Ruby does not have abstract classes) which has a template method that behaves differently for each sub class.
Since Ruby does not have the concept of abstract classes the behaviour can be mimiced using method bodies that are either empty of have a "raise <exception>" as the only statement in them.

### Example, Shape class

A shape class that has 

```ruby
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
```

The above class is a super class which acts as a template class, the method ```shapeStats``` is a template method.Any shape that extends from this template class will have to implement the template method(s). Some times there are methods that are called hook methods in the template class, they are non-abstract methods that can be overridden in the sub classes.

```ruby
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
```
## Decorator Design pattern

The decorator design pattern is useful when we have a basic class whose behaviour needs to be augumented at run time. We have a `component` interface which is implemented by a `ConcreteComponent` and a `Decorator` classes. The decorator class has an instance of the `component` class.

The decorator object is inserted between the component and the client to add its additional behaviour. This also helps in `chaining` of features. 

![Image of Decorator](https://github.com/mvemjsun/design_patterns/blob/master/I_Decorator/decorator.jpg)

### Example, Haircuts !!

We have an option of having a `SimpleHaircut` or one of the decorated haircuts. We can just chain the options that we want at run time. All the decorator objects have the same interface, some of them can add to the basic interface like the `HaircutWithMohicanStyle` class that adds the `style` method generated via the attr_reader method. 

```ruby
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

```

Usage might look like

```ruby
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

```

Output
```
SimpleHaircut Initialized
HaircutWithShampoo Initialized
Giving you a SimpleHaircut
Giving you a HaircutWithShampoo

SimpleHaircut Initialized
HaircutWithColour Initialized
HaircutWithShampoo Initialized
Giving you a SimpleHaircut
Giving you a HaircutWithColour
Giving you a HaircutWithShampoo

SimpleHaircut Initialized
HaircutWithColour Initialized
HaircutWithShampoo Initialized
HaircutWithMohicanStyle Initialized
Giving you a SimpleHaircut
Giving you a HaircutWithColour
Giving you a HaircutWithShampoo
Giving you a HaircutWithMohicanStyle

SimpleHaircut Initialized
HaircutWithMohicanStyle Initialized
Giving you a SimpleHaircut
Giving you a HaircutWithMohicanStyle
```

[Back] (https://github.com/mvemjsun/design_patterns/blob/master/README.md)
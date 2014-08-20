## Strategy Design pattern

 As we saw in template design pattern that we rely on inheritance to get the template behaviour into our sub classes. In the strategy design pattern we aim towards delegation and not inheritance. The behaviour that can change is placed into its own strategy class (or may be a code block such as procs or lambdas) which is then used by the "context" class as needed, this is a way to "pull" the strategy as needed into the "context". 

### Example, TaxCalculator 

Below is a very simplistic view of a strategy that may be needed to calculate tax for different countries. Say we have different tax calculation ```strategies``` for different countries.

```ruby
class UKTaxCalculator

	def calculate_tax(data)
	  # UK specific implementation
	end
end
```

```ruby
class USTaxCalculator
	
	def calculate_tax(data)
	  # US specific implementation
	end
end
```

we then have a ```context``` class that needs to use these calculation strategies as the case may be. Below is a very simplistic case of an initialize that needs a strategy object (to keep things simple I have not included salary amounts etc)

```ruby
class SalaryCalculator

	def initialize(strategy)
	  @tax_strategy = strategy
	end

	def calculate_salary
	  @tax_strategy.calculate_tax(self)
	end
end
```

In order to use the strategy we would need to initialize the ```context``` class (```SalaryCalculator``` in this case) like below. Notice that in order to share the data between the context and the strategy we use the ```self``` reference in the ```cacculate_salary``` method.

```ruby
  usCalculator = SalaryCalculator.new(USTaxCalculator.new)
  ukCalculator = SalaryCalculator.new(UKTaxCalculator.new)
  ...
```
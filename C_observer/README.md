## Observer Design pattern

The observer design pattern is suited for use when we have a ```subject``` and objects that are interested in the events of the subject, these objects are called the ```observers```. 

A simple implementation of the observer pattern will have the ```subject``` class implement some sort of mechanism do that it keep's a tract of all of its observers, additionally there needs to be an ability to "add", "delete" and "notify" the observers. This could be achieved manually by writing our own code as well or we can use ruby's built in ```Observable``` module. This module provides all the boiler plate code to the including class as we will see shortly.

For example consider a simplistic view of a subject class called ```Employee``` and then their is an observer called ```Payroll```. Whenever the salary of an employee changes the ```Payroll``` department needs to update its database.

### Example, Employee as Subject and Payroll as an observer

```ruby
require 'observer'

class Employee

	include 'Observable'
	attr_reader :name, :dept, :salary

	def initialize(name,dept,salary)
	  @name = name
	  @dept=dept
	  @salary=salary
	end

	#
	# Note the use of changed method before the call to notify_observers
	# this sets a boolean flag indicating that the object has actually changed
	# thus avoiding unnecessary updates if the object has not actually changed.
	#
	def raise_salary(new_salary)
	  @salary=new_salary
	  changed
	  notify_observers(self)
	end

	def register(observer)
	  self.add_observer(observer)
	end
end
```

The observer class ```Payroll```

```ruby
class Payroll

	def initialize
	  
	end

	def update(employee)
	  p "Updating employee details for #{employee.name}, salary = #{employee.salary}."
	end
end
```

Usage might look like

```ruby
payroll = Payroll.new
sam = Employee.new("Sam","HR",1500)
sam.register(payroll)
sam.raise_salary(2000)

jane = Employee.new("Jane","SALES",1900)
jane.register(payroll)
jane.raise_salary(2100)

```

[Back] (https://github.com/mvemjsun/design_patterns/blob/master/README.md)
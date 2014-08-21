require 'observer'

class Employee

	include Observable
	attr_reader :name, :dept, :salary

	def initialize(name,dept,salary)
	  @name = name
	  @dept=dept
	  @salary=salary
	end

	#
	# Note the use of changed method before the call to notify_observers
	# this sets a boolean flag indicating whether the object has actually changed
	# thus avoiding unnecessary updates
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

class Payroll

	def initialize
	  
	end

	def update(employee)
	  p "Updating employee details for #{employee.name}, salary = #{employee.salary}."
	end
end

payroll = Payroll.new
sam = Employee.new("Sam","HR",1500)
sam.register(payroll)
sam.raise_salary(2000)

jane = Employee.new("Jane","SALES",1900)
jane.register(payroll)
jane.raise_salary(2100)
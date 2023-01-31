class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (salary) * multiplier
    bonus
  end
end

class Manager < Employee


  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees # array of employees
  end

  def bonus(multiplier)
    calculate_employees_salaries * multiplier
  end

  def calculate_employees_salaries 
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.calculate_employees_salaries
      else
        sum += employee.salary
      end
    end
    sum
  end
end

ned = Employee.new('Ned', 'Founder', 1000000,	nil)
shawna = Employee.new('Shawna',	'TA', 12000,	'Darren')
david = Employee.new('David',	'TA', 10000,	'Darren')
darren = Manager.new('Darren', 'TA Manager', 78000, 'Ned', [shawna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
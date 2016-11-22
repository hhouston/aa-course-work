class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplyer)
    bonus = salary * multiplyer
    bonus
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(*args)
    super(*args)
    @employees = []
  end

  def bonus(multiplyer)
    total_salary = 0

    employees.each do |employee|
      total_salary += employee.salary
    end
    bonus = total_salary * multiplyer
    bonus
  end
end

ned = Manager.new("ned", "Founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)
ned.employees = [darren,shawna,david]
darren.employees = [shawna,david]


# ned = Manager.new([darren])



p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)

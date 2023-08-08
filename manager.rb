require_relative 'employee'
class Manager < Employee
    def initialize(name, title, salary, boss)
        @reports = []
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        subemployee_salaries = reports.sum {|report| report.salary}
        subemployee_salaries * multiplier
    end

    # protected
    # :

end
class Employee

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        add_reports if !boss.nil?
    end

    def bonus(multiplier)
        salary * multiplier
    end

    def add_reports
        boss.reports << self
    end

    protected
    attr_reader :name, :title, :salary, :boss

end

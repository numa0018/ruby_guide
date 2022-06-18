class Person
  def initialize(money)
    @money = money
  end

  def billionaire?
    money >= 1000000000
  end

  private
    def money
      @money
    end
end

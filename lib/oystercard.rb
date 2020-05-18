class Oystercard

attr_reader :balance

LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "£#{LIMIT} limit exceeded" if @balance + money > LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

end

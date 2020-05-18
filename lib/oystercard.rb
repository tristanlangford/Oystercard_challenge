class Oystercard

attr_reader :balance, :journey


LIMIT = 90
MINIMAL_BALANCE = 1

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(money)
    fail "£#{LIMIT} limit exceeded" if @balance + money > LIMIT

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def journey?
    @journey
  end

  def touch_in
    fail "Minimal balance: £#{MINIMAL_BALANCE}" if @balance < MINIMAL_BALANCE
    
    @journey = true
  end

  def touch_out
    @journey = false
  end

end

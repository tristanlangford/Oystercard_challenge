class Oystercard

attr_reader :balance, :journey, :entry_station


LIMIT = 90
MINIMAL_BALANCE = 1
MINIMAL_FARE = 1

  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(money)
    fail "£#{LIMIT} limit exceeded" if @balance + money > LIMIT

    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def journey?
    @entry_station.nil? == false
  end

  def touch_in(station)
    fail "Minimal balance: £#{MINIMAL_BALANCE}" if @balance < MINIMAL_BALANCE
    @journey = true
    @entry_station = station

  end

  def touch_out
    @balance -= MINIMAL_FARE
    @journey = false
    @entry_station = nil
  end

end

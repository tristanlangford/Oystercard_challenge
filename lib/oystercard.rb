class Oystercard

attr_reader :balance, :journey_history, :entry_station


LIMIT = 90
MINIMAL_BALANCE = 1
MINIMAL_FARE = 1

  def initialize
    @balance = 0
    @entry_station
    @journey_history = []
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
    @entry_station = station

  end

  def touch_out(station)
    @balance -= MINIMAL_FARE
    @journey_history.push({entry_station: @entry_station, exit_station: station})
    @entry_station = nil
  end

end

class Oystercard
  attr_reader :balance, :in_use
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(pounds)
    fail "Limit of £#{MAXIMUM_BALANCE} Exceeded" if pounds + @balance > MAXIMUM_BALANCE
    @balance += pounds
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "Insufficient balance – (£#{MINIMUM_BALANCE}) needed" if @balance < MINIMUM_BALANCE
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_use = false
  end

  private
  def deduct(pounds)
    @balance -= pounds
  end
end

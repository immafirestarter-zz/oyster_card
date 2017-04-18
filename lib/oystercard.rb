class Oystercard
  attr_reader :balance, :in_use
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(pounds)
    fail "Limit of £#{MAXIMUM_BALANCE} Exceeded" if pounds + @balance > MAXIMUM_BALANCE
    @balance += pounds
  end

  def deduct(pounds)
    @balance -= pounds
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end
end

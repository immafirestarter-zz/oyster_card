class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance =0
  end

  def top_up(pounds)
    fail "Limit of £#{MAXIMUM_BALANCE} Exceeded" if pounds + @balance > MAXIMUM_BALANCE
    @balance = @balance + pounds
  end

end

class Oystercard
  attr_reader :balance
  def initialize
    @balance =0
end
def top_up(pounds)
@balance = @balance + pounds
end
end

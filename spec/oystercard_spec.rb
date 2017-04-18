require './lib/oystercard'

describe Oystercard do
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  it "has default value of 0" do
    expect(subject.balance).to eq(0)
  end

  context "topping up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "can increase the balance" do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it "fails when maximum capacity is exceeded" do
      subject.top_up(80)
      expect { subject.top_up 20 }.to raise_error "Limit of £#{MAXIMUM_BALANCE} Exceeded"
    end
  end

  context '#deduct' do
    it "deducts money from an oyster card that has money on it" do
      subject.top_up(20)
      expect(subject.deduct(10)).to eq 10
    end
  end

  context '#in_journey?' do
    it "starts off being not in a journey" do
    expect(subject.in_journey?).to eq false
    end
  end

  context '#touch_in' do
    it "changes to true when touched in" do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
    it "throws an error when there is insufficient funds on the card to touch in" do
      expect { subject.touch_in }.to raise_error "Insufficient balance – (£#{MINIMUM_BALANCE}) needed"
    end
  end

  context '#touch_out' do
    it "changes back to false when touching out" do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end

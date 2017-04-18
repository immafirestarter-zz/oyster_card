require './lib/oystercard'

describe Oystercard do

it "has default value of 0" do
expect(subject.balance).to eq(0)
end

context "topping up" do

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it "can increase the balance" do
  expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
end
end
end

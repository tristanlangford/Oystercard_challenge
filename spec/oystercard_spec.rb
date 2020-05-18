require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  it 'can access the  default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up the balance with the argument value' do
    subject.top_up(20)
    expect(subject.balance).to eq(20)
  end 
end

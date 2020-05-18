require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  it 'can access the  default balance of 0' do
    expect(subject.balance).to eq(0)
  end
end

require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }

  LIMIT = 90

  it 'can access the  default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up the balance with the argument value' do
    subject.top_up(20)
    expect(subject.balance).to eq(20)
  end

  it 'raises an error when balance would be over £90 after topup' do
    expect { subject.top_up(LIMIT + 1) }.to raise_error("£#{LIMIT} limit exceeded")
  end

  it 'deducts the balance with the argument value' do
    subject.deduct(20)
    expect(subject.balance).to eq(-20)
  end
end

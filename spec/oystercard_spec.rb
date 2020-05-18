require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }

  LIMIT = 90
  MINIMAL_BALANCE = 1

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

  it 'should return false if not touched in yet' do
    expect(subject.journey?).to be false
  end

  it 'updates the instance variable if touch_in' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_journey
  end

  it 'updates the instance variable if touch_out' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).to_not be_journey
  end

  it 'raises an error when touch in with less than minimal balance' do
    expect { subject.touch_in }.to raise_error("Minimal balance: £#{MINIMAL_BALANCE}")
  end
end

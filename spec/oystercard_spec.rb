require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  let(:oxfordStreet) { double('station') }
  let(:bank) { double('station') }

  LIMIT = 90
  MINIMAL_BALANCE = 1
  MINIMAL_FARE = 1


  it 'can access the  default balance of 0' do
    expect(Oystercard.new.balance).to eq(0)
  end

  before do
    subject.top_up(1)
  end

  it 'tops up the balance with the argument value' do
    expect(subject.balance).to eq(1)
  end

  it 'raises an error when balance would be over £90 after topup' do
    expect { subject.top_up(LIMIT) }.to raise_error("£#{LIMIT} limit exceeded")
  end

  it 'deducts the balance with the argument value' do
    subject.deduct(1)
    expect(subject.balance).to eq(0)
  end

  it 'should return false if not touched in yet' do
    expect(subject.journey?).to be false
  end

  it 'updates the instance variable if touch_in' do
    subject.touch_in(oxfordStreet)
    expect(subject).to be_journey
  end

  it 'updates the instance variable if touch_out' do
    subject.touch_in(oxfordStreet)
    subject.touch_out(bank)
    expect(subject).to_not be_journey
  end

  it 'raises an error when touch in with less than minimal balance' do
    subject.touch_out(bank)
    expect { subject.touch_in(oxfordStreet) }.to raise_error("Minimal balance: £#{MINIMAL_BALANCE}")
  end

  it 'reduces balance by minimal fare when Touch_out' do
    expect { subject.touch_out(bank) }.to change{ subject.balance }.by(-MINIMAL_FARE)
  end

  it 'remember the station after Touched_in' do
    subject.touch_in(oxfordStreet)
    expect(subject.entry_station).to eq(oxfordStreet)
  end

  it 'forget about the entry station after Touch_out' do
    subject.touch_in(oxfordStreet)
    subject.touch_out(bank)
    expect(subject.entry_station).to be_nil
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journey_history).to be_empty
  end

  it 'store_journey to add completed journey to journey_history' do
    subject.touch_in(oxfordStreet)
    subject.touch_out(bank)
    expect(subject.journey_history).to include({entry_station: oxfordStreet, exit_station: bank})
  end

end

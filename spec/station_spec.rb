require 'station'

describe Station do

  subject { Station.new("bank", 1) }

  it 'sets the zone via the argument' do
    expect(subject.zone).to eq(1)
  end

  it 'sets the name via the argument' do
    expect(subject.name).to eq("bank")
  end

end

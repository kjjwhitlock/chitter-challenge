require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
    peeps = Peep.all
    expect(peeps).to include("oh hey world")
    expect(peeps).to include("Doge all day, doge all night")
    expect(peeps).to include("Please leave me alone we are sleeping, thsnks")
    end
  end
end

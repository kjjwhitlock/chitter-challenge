require 'peep'
require 'spec_helper'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
    Peep.create(text: "oh hey world1!")
    Peep.create(text: "oh hey world2!")
    peeps = Peep.all
    expect(peeps.first.text).to eq 'oh hey world2!'
    expect(peeps.length).to eq 2
    end
  end

  describe '.create' do
    it 'creates a new peep' do
    Peep.create(text: "oh hey world4!")
    peeps = Peep.all
    expect(peeps.first.text).to eq "oh hey world4!"
    end
  end
end

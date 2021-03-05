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

  describe '#comments' do
    it 'returns a list of comments on the peep' do
      peep = Peep.comment(comment: "Test peep for commenting on")
      DatabaseConnection.query("INSERT INTO comments (comment, peep_id) VALUES('Test comment', #{peep.id})")
      comment = peep.comments.first
      expect(comment['comment']).to eq 'Test comment'
    end
  end
end

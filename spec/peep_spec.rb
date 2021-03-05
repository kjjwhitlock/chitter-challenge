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
    peep = Peep.create(text: "oh hey world4!")
    peeps = Peep.all
    expect(peeps.first.text).to eq "oh hey world4!"
    end
  end

  describe '#comments' do
    it 'returns a list of comments on the peep' do
      peep = Peep.create(text: "oh hey world4!")
      peep2 = Peep.create(text: "This is a second peep")
      comment = Comment.create(comment: 'This is a comment', peep_id: peep.id)
      expect(comment.comment).to eq 'This is a comment'
      expect(comment).to be_a Comment
    end
  end
end

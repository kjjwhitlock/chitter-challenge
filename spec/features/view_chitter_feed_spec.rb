require 'pg'

feature 'adds a new peep to the chitter feed' do
  scenario 'user can add a peep to the feed' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps/new')
    fill_in :text, with: 'this is my first peep!'
    click_button
    expect(page).to have_content('this is my first peep!')
  end
end

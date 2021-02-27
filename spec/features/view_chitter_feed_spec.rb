feature 'allows user to view chitter feed' do
scenario 'user can see posted cheeps' do
  visit('/')
  fill_in :text, with: 'This is my first cheep!'
  expect(page).to have_content('This is my first cheep!')
end
end

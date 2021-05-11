feature 'registration' do
  scenario 'somebody can sign up' do
    visit '/users/new'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'testpassword'
    click_button 'Submit'
    expect(page).to have_content "Welcome, test@example.com!"
  end
end

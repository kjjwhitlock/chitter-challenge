feature 'Deleting a peep do' do
    scenario 'A user can delete a peep' do
        peep = Peep.create(text: "burrito")
        visit('/peeps')
        expect(page).to have_text("burrito")
        first('.peep').click_button 'Delete'
        expect(current_path).to eq '/peeps'
        expect(page).not_to have_text("burrito")
    end
end
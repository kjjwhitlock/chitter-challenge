feature 'Deleting a peep do' do
    scenario 'A user can delete a peep' do
        peep = Peep.create(text: "test peep")
        visit('/peeps')
        expect(page).to have_text("test peep")
        first('.peep').click_button 'Delete'
        expect(current_path).to eq '/peeps'
        visit('/peeps')
        expect(page).not_to have_text("test peep")
    end
end
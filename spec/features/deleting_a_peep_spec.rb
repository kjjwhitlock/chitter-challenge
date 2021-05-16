feature 'Deleting a peep do' do
    scenario 'A user can delete a peep' do
        Peep.new(id: 1234, text: "test peep", created_at: nil)
        visit('/peeps')
        expect(page).to include("test peep")
        first('.peep').click_button 'Delete'
        expect(current_path).to eq '/bookmarks'
        expect(page).not_to include("test peep")
    end
end
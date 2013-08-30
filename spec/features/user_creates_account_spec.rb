require 'spec_helper'

# In order to gather the WDI June 2013 group into a chat room
# as a WDI admin, 
# I  want to create the group.

feature "user creates account", js: true do
    context "successfully" do
      scenario "creating an account" do
        visit '/users/new'

        fill_in 'new', with: 'Shana'

       

        click_button 'save'

        expect(page).to have_content 'new'
        expect(page).to have_content 'Shana'
        expect(current_path).to eql users_path
      end
    end
  end
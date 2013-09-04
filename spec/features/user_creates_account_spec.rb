require 'spec_helper'

# In order to gather the WDI June 2013 group into a chat room
# as a WDI admin, 
# I  want to create the group.

feature "user creates account", js: true do
    context "successfully" do
      scenario "creating an account" do
        visit '/users/new'

        fill_in 'First name', with: 'Shana'
        fill_in 'Last name', with: 'Weitzen'
        fill_in 'Email', with: 'shanaweitzen@gmail.com'
        fill_in 'Password', with: 'KoalaApp'

       

        click_button 'save'

        expect(page).to have_content 'Shana'
        expect(page).to have_content 'Weitzen'
        expect(page).to have_content 'shanaweitzen@gmail.com'
        expect(page).to have_content 'email'
        expect(page).to have_content 'KoalaApp'
        expect(current_path).to eql users_path
      end
    end
  end
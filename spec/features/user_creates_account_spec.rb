require 'spec_helper'

# In order to gather the WDI June 2013 group into a chat room
# as a WDI admin, 
# I  want to create the group.

feature "user creates account", js: true do
    context "successfully" do
      scenario "creating an account" do
        visit '/users/new'

        fill_in 'First name', with: 'Kermit'
        fill_in 'Last name', with: 'Frog'
        # fill_in 'Email', with: 'kermitthefrog@gmail.com'
        fill_in 'Password', with: 'kermitthefrog'

       

        click_button 'Sign In'


        expect(page).to have_content 'Kermit'
        expect(page).to have_content 'Frog'
        # expect(page).to have_content 'kermitthefrog@gmail.com'
        expect(page).to have_content 'kermitthefrog'
        expect(current_path).to eql new_user_path
      end
    end
  end
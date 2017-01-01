require 'rails_helper'

# Create test helper method to look for content on the home page
RSpec.feature "User visits homepage" do 
	scenario "successfully and sees a logo" do 
		visit root_path
		expect(page).to have_content "My_Perspective"
	end
end
require "rails_helper"

# Creating helper tests to go through the steps to write a post

RSpec.describe "Creating post" do 

# call and create signed in user action from support/features module
let(:user) {User.create(username: "exampleuser", email: "example@user.com", password: 'password', password_confirmation: 'password')}

	scenario "successfully" do 
		# List all the actions needed to create a post
		sign_in user
		visit root_path
		click_on "Write a story"

		fill_in "Title", with: "My first post"
		fill_in "Body", with: "Some mad decent content"
		click_on "Publish"

		# Page will find title of post
		within(".posts") do
			expect(page).to have_content "My first post"
			expect(page).to have_content "exampleuser"
		end
	end

	scenario "unsucessful" do 
		sign_in user
		visit root_path
		click_on "Write a story"

		fill_in "Title", with: "My second post"
		fill_in "Body", with: ""
		click_on "Publish"

		expect(page).to have_css ".error"
	end

	scenario "Non-logged in user cannot create post" do
		visit root_path
		click_on "Write a story"

		expect(current_path).to eq(new_user_session_path)
	end
end
require "rails_helper"

# Creating helper tests to go through the steps to write a post

RSpec.describe "Creating post" do 
	scenario "successfully" do 
		visit root_path
		click_on "Write a story"

		fill_in "Title", with: "My first post"
		fill_in "Body", with: "Some mad decent content"
		click_on "Publish"

		# Page will find title of post
		expect(page).to have_content "My first post"
	end

	scenario "unsucessful" do 
		visit root_path
		click_on "Write a story"

		fill_in "Title", with: "My second post"
		fill_in "Body", with: ""
		click_on "Publish"

		expect(page).to have_css ".error"
	end
end
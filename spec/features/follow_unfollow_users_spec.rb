require "rails_helper"

RSpec.feature "Following / Unfollowing Users" do 
	# Create a user to run test scenarios 
	let(:vader) {create(:user, username: "Darth Vader")}
	let(:solo) {create(:user, username: "Han Solo")}

	scenario "signed-in user can follow and unfollow other users" do
		# Sign in
		sign_in vader
		visit user_path(solo)
		# Test to make sure pages find each other
		# expect(page).to have_content(solo.username)
		click_on "Follow"
		expect(page).not_to have_button("Follow")
		expect(page).to have_button("Unfollow")
	end
end
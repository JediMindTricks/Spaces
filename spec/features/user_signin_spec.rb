require "rails_helper"

RSpec.feature "User signing in" do 

background do
	@user = create(:user)
end

scenario "successful" do
	sign_in @user

	expect(page).to have_content @user.email
end

scenario "unsucessful" do
	visit new_user_session_path
	fill_in "Email", with: "wrongemail"
	fill_in "Password", with: "wrongpassword"
	click_on "Log in"

	expect(page).not_to have_content @user.email
end

end
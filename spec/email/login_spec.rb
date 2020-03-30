require 'rails_helper'
RSpec.describe "as a guess user", type: :feature do
  describe "on the dashboard" do
    it "can see message to log in and check email" do
      user = create(:user)
      visit '/login'

      fill_in :session_email, with: user.email
      fill_in :session_password, with: user.password

      click_on "Log In"

      expect(page).to have_content("Logged in as #{user.first_name}")
      expect(user.status).to eq("non_active")
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end

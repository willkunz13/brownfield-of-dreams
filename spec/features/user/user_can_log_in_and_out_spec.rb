require 'rails_helper'

describe 'User' do
  it 'user can sign in', :vcr do
    user = create(:user)

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
  end

  it 'can log out', :js, :vcr do
    user = create(:user)

    visit login_path

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password

    click_on 'Log In'

    click_on 'Profile'

    expect(current_path).to eq(dashboard_path)

    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content(user.first_name)
    expect(page).to have_content('SIGN IN')
  end

  it 'is shown an error when incorrect info is entered', :vcr do
    user = create(:user)
    fake_email = "email@email.com"
    fake_password = "123"

    visit login_path

    fill_in'session[email]', with: fake_email
    fill_in'session[password]', with: fake_password

    click_on 'Log In'

    expect(page).to have_content("Looks like your email or password is invalid")
  end

  it "can flash error if username already exist" do
    user = create(:user, email: "ray@mail.com", first_name: "ray")
    visit '/register'
    
    fake_email = "ray@mail.com"

    fill_in :user_email, with: fake_email
    fill_in :user_first_name, with: "fake"
    fill_in :user_last_name, with: "fake"
    fill_in :user_password, with: "fake"
    fill_in :user_password_confirmation, with: "fake"

    click_on 'Create Account'

    expect(page).to have_content("Username already exists")
  end
end

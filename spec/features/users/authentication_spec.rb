require 'rails_helper'

feature 'Authentication', js: true do
  before do
    @user = create(:confirmed_user)

    visit '#/sign_in'
  end

  feature 'login' do
    scenario 'with valid inputs' do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password

      find("button", text: "Sign in").click

      expect(page).to have_content('Sign out')
    end

    scenario 'with invalid credentials' do
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "random_string"

      find("button", text: "Sign in").click

      expect(page).to have_content('Invalid login credentials. Please try again.')
    end

    scenario 'redirect after login' do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password

      find("button", text: "Sign in").click

      expect(page).to have_content('HTML5 Boilerplate')
    end
  end
end

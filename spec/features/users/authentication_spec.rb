require 'rails_helper'

feature 'Authentication', js: true do
  feature 'login' do
    scenario 'with valid inputs' do
      visit '#/sign_in'
      fill_in "Email", with: "user1@test.com"
      fill_in "Password", with: "password"
      find("button", text: "Sign in").click
      expect(page).to have_content('Sign out')
    end
  end
end

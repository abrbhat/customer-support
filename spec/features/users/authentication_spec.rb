require 'rails_helper'

feature 'Authentication', js: true do
  feature 'login' do
    scenario 'with valid inputs' do
      @user = User.create({email: "user1@test.com", password: "password"})

      visit '#/sign_in'
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      binding.pry
      find("button", text: "Sign in").click
      expect(page).to have_content('Sign out')
    end
  end
end

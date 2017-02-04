require 'rails_helper'

feature "Registration", js: true do
  let(:email) { Faker::Internet.email }

  feature "with valid inputs" do
    let(:password) { Faker::Internet.password }

    before(:each) do
      @registration_page = RegistrationPage.new
      @registration_page.visit
      @registration_page.register(email, password)
    end

    scenario "account creation" do
      find("a", text: "Sign out").click

      @login_page = LoginPage.new
      @login_page.visit
      @login_page.sign_in(email, password)

      expect(page).to have_content('Sign out')
    end

    scenario "sign-in upon account creation" do
      expect(page).to have_content('Sign out')
    end
  end

  scenario 'with an invalid password' do
    @registration_page = RegistrationPage.new
    @registration_page.visit
    @registration_page.register("user@test.com", "a")

    expect(page).to have_content('Password is too short')
  end
end

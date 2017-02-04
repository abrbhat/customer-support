require 'rails_helper'

feature 'Authentication', js: true do
  feature 'login' do
    feature 'with valid credentials' do
      before do
        @user = create(:confirmed_user)

        @login_page = LoginPage.new
        @login_page.visit
        @login_page.sign_in(@user.email, @user.password)
      end

      scenario 'sign out option' do
        expect(page).to have_content('Sign out')
      end

      scenario 'redirect after login' do
        expect(page).to have_content('HTML5 Boilerplate')
      end
    end

    scenario 'with invalid credentials' do
      @login_page = LoginPage.new
      @login_page.visit
      @login_page.sign_in('invalid@test.com', 'not the actual password')
      
      expect(page).to have_content('Invalid login credentials. Please try again.')
    end
  end
end

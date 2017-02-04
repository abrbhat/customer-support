require 'rails_helper'

feature 'Authentication', js: true do
  before do
    @user = create(:confirmed_user)
  end

  feature 'login' do
    feature 'with valid credentials' do
      before do
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

  feature 'page access' do
    scenario 'visiting support_requests page when signed in' do
      @login_page = LoginPage.new
      @login_page.visit
      @login_page.sign_in(@user.email, @user.password)

      # We want Capybara to wait for sign-in to finish happening
      # before we visit #/support_requests.
      expect(page).to have_content('HTML5 Boilerplate')

      visit '#/support_requests'
      expect(page).to have_css('h1', text: 'Support Requests')
    end

    scenario 'visiting "support_requests" page when not signed in' do
      visit '#/support_requests'
      expect(page).not_to have_css('h1', text: 'Support Requests')
    end
  end
end

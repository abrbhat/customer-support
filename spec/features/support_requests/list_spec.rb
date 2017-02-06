require 'rails_helper'

feature 'Authentication', js: true do
  before do
    @customer = create(:customer)
    @support_requests = create_list(
      :support_requests,
      :customer => @customer
    )
  end

  feature 'support_requests' do
    feature 'list' do
      before do
        login_as(@customer, :scope => :user)
      end

      scenario 'sign out option' do
        expect(page).to have_content('Sign out')
      end
    end
  end
end

require 'rails_helper'

feature 'Support Request List', js: true do
  before(:each) do
    @customer = create(:customer)
  end

  scenario 'user not logged in' do
    SupportRequestListPage.visit

    expect(page).not_to have_content('Support Requests')
  end

  feature 'user logged in' do
    before(:each) do
      LoginPage.complete_login(@customer.email, @customer.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'support requests are present' do
      @support_requests = create_list(
        :support_request,
        3,
        :customer => @customer
      )

      SupportRequestListPage.visit

      page.evaluate_script 'window.location.reload()'

      expect(page).to have_content('Support Requests')
      expect(page).not_to have_content('No Support Requests Present')
    end

    scenario 'support requests are not present' do
      SupportRequestListPage.visit

      page.evaluate_script 'window.location.reload()'

      expect(page).to have_content('Support Requests')
      expect(page).to have_content('No Support Requests Present')
    end
  end
end

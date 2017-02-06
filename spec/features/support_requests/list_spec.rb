require 'rails_helper'

feature 'Support Requests', js: true do
  before do
    @customer = create(:customer)
    @support_requests = create_list(
      :support_request,
      3,
      :customer => @customer
    )
  end

  feature 'list' do
    before do
      @login_page = LoginPage.new
      @login_page.complete_login(@customer.email, @customer.password)

      @support_request_list_page = SupportRequestListPage.new
      @support_request_list_page.visit
    end

    scenario 'should be present' do
      expect(page).to have_content('Support Requests')
    end
  end
end

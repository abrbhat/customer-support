require 'rails_helper'

feature 'Report View', js: true do
  before do
    @agent = create(:agent)
    @customer = create(:customer)

    @support_requests = create_list(
      :support_request,
      5,
      status: 'closed',
      customer: @customer
    )
  end

  scenario 'agent not logged in' do
    ReportViewPage.visit

    expect(page).not_to have_content('Report')
  end

  feature 'agent logged in' do
    before do
      LoginPage.complete_login(@agent.email, @agent.password)

      expect(page).to have_content('Support Requests')

      find("button", text: "View Report").click
    end

    scenario 'page is accessible' do
      expect(page).to have_content('Download')
    end
  end
end

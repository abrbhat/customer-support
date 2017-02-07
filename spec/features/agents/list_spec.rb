require 'rails_helper'

feature 'Agent List', js: true do
  before(:each) do
    @admin = create(:admin)
    @agent = create(:agent)
  end

  scenario 'admin not logged in' do
    AgentListPage.visit

    expect(page).not_to have_content('Agents')
  end

  feature 'admin logged in' do
    before(:each) do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'agents are present' do
      AgentListPage.visit

      expect(page).to have_content('Agents')
      expect(page).to have_content(Agent.first.email)
    end
  end
end

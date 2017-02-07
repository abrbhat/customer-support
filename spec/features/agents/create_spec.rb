require 'rails_helper'

feature 'Agent Create', js: true do
  before do
    @admin = create(:admin)
    @agent = create(:agent)
  end

  scenario 'admin not logged in' do
    AgentCreatePage.visit

    expect(page).not_to have_content('New Agent')
  end

  feature 'admin logged in' do
    before do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')

      AgentListPage.visit

      expect(page).to have_content('Agents')

      expect(page).to have_content('Create New')
    end

    scenario 'create new agent form is present' do
      find("button", text: "Create New").click

      expect(page).to have_content('New Agent')
    end

    feature 'create new agent' do
      before do
        find("button", text: "Create New").click

        expect(page).to have_content('New Agent')
      end

      scenario 'fill form and submit' do
        fill_in "Email", with: "agent1@test.com"

        fill_in "Password", with: "password"

        find("button", text: "Create").click

        expect(page).to have_content('Agent')

        expect(page).to have_content('agent1@test.com')

        expect(page).to have_content('Remove')
      end
    end
  end
end

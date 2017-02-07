require 'rails_helper'

feature 'Agent View', js: true do
  before do
    @admin = create(:admin)
    @agent1 = create(:agent)
    @agent2 = create(:agent)
  end

  scenario 'admin not logged in' do
    AgentViewPage.visit(@agent1.id)

    expect(page).not_to have_content('Agent')
  end

  feature 'admin logged in' do
    before do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')

      AgentListPage.visit

      expect(page).to have_content('Agents')
    end

    scenario 'agent is present' do
      find("a", text: "View", match: :first).click

      expect(page).to have_content('Remove')
    end

    feature 'remove' do
      before do
        find("a", text: "View", match: :first).click

        expect(page).to have_content('Remove')
      end

      scenario 'deletes agent on click' do
        find("button", text: "Remove").click

        page.driver.browser.switch_to.alert.accept

        expect(page).to have_content('Agents')

        expect(page).not_to have_content(@agent2.email)
      end
    end
  end
end

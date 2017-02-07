require 'rails_helper'

feature 'Support Request Create', js: true do
  before do
    @customer = create(:customer)
    @agent = create(:agent)
  end

  scenario 'user not logged in' do
    SupportRequestCreatePage.visit(@support_request.id)

    expect(page).not_to have_content('New Support Request')
  end

  feature 'user logged in' do
    before do
      LoginPage.complete_login(@customer.email, @customer.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'create new support request form is present' do
      find("bitton", text: "Create New").click

      expect(page).to have_content('New Support Request')
    end

    feature 'create new support request' do
      before do
        find("button", text: "Create New").click

        expect(page).to have_content('New Support Request')
      end

      scenario 'fill form and submit' do
        find("option[value='installation_and_setup']").click

        find("option[value='medium']").click

        fill_in "Subject", with: "Problem with installing Skype"

        fill_in "Description",
                with: "I am having an error when installing Skype on Windows 10."

        find("button", text: "Create").click
        
        expect(page).to have_content('Support Request')

        expect(page).to have_content('Installation and setup')

        expect(page).to have_content('Medium')

        expect(page).to have_content('Close')
      end
    end
  end
end

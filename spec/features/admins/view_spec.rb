require 'rails_helper'

feature 'Admin View', js: true do
  before do
    @admin1 = create(:admin)
    @admin2 = create(:admin)
  end

  scenario 'admin not logged in' do
    AdminViewPage.visit(@admin1.id)

    expect(page).not_to have_content('Admin')
  end

  scenario 'non-admin user logged in' do
    @customer = create(:customer)

    LoginPage.complete_login(@customer.email, @customer.password)

    expect(page).to have_content('Support Requests')

    AdminViewPage.visit(@admin1.id)

    expect(page).not_to have_content('Admin')
  end

  feature 'admin logged in' do
    before do
      LoginPage.complete_login(@admin1.email, @admin1.password)

      expect(page).to have_content('Support Requests')

      AdminListPage.visit

      expect(page).to have_content('Admins')
    end

    scenario 'admin is present' do
      find("a", text: "View", match: :first).click

      expect(page).to have_content('Remove')
    end

    feature 'remove' do
      before do
        find("a", text: "View", match: :first).click

        expect(page).to have_content('Remove')
      end

      scenario 'deletes admin on click' do
        find("button", text: "Remove").click

        page.driver.browser.switch_to.alert.accept

        expect(page).to have_content('Admins')

        expect(page).not_to have_content(@admin2.email)
      end
    end
  end
end

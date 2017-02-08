require 'rails_helper'

feature 'Customer View', js: true do
  before do
    @admin = create(:admin)
    @customer = create(:customer)
  end

  scenario 'admin not logged in' do
    CustomerViewPage.visit(@customer.id)

    expect(page).not_to have_content('Customers')
  end

  scenario 'non-admin user logged in' do
    LoginPage.complete_login(@customer.email, @customer.password)

    expect(page).to have_content('Support Requests')

    CustomerViewPage.visit(@customer.id)

    expect(page).not_to have_content('Customers')
  end

  feature 'admin logged in' do
    before do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')

      CustomerListPage.visit

      expect(page).to have_content('Customers')
    end

    scenario 'customer is present' do
      find("a", text: "View", match: :first).click

      expect(page).to have_content('Support Requests')
    end
  end
end

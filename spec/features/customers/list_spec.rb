require 'rails_helper'

feature 'Customer List', js: true do
  before(:each) do
    @admin = create(:admin)
    @customer = create(:customer)
  end

  scenario 'admin not logged in' do
    CustomerListPage.visit

    expect(page).not_to have_content('Customers')
  end

  scenario 'non-admin user logged in' do
    LoginPage.complete_login(@customer.email, @customer.password)

    expect(page).to have_content('Support Requests')

    CustomerListPage.visit

    expect(page).not_to have_content('Customers')
  end

  feature 'admin logged in' do
    before(:each) do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'customers are present' do
      CustomerListPage.visit

      expect(page).to have_content('Customers')
      expect(page).to have_content(Customer.first.email)
    end
  end
end

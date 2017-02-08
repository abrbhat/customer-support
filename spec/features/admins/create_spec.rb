require 'rails_helper'

feature 'Admin Create', js: true do
  before do
    @admin = create(:admin)
  end

  scenario 'admin not logged in' do
    AdminCreatePage.visit

    expect(page).not_to have_content('New Admin')
  end

  scenario 'non-admin user logged in' do
    @customer = create(:customer)

    LoginPage.complete_login(@customer.email, @customer.password)

    expect(page).to have_content('Support Requests')

    AdminCreatePage.visit

    expect(page).not_to have_content('New Admin')
  end

  feature 'admin logged in' do
    before do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')

      AdminListPage.visit

      expect(page).to have_content('Admins')

      expect(page).to have_content('Create New')
    end

    scenario 'create new agent form is present' do
      find("button", text: "Create New").click

      expect(page).to have_content('New Admin')
    end

    feature 'create new agent' do
      before do
        find("button", text: "Create New").click

        expect(page).to have_content('New Admin')
      end

      scenario 'fill form and submit' do
        fill_in "Email", with: "admin2@test.com"

        fill_in "Password", with: "password"

        find("button", text: "Create").click

        expect(page).to have_content('Admin')

        expect(page).to have_content('admin2@test.com')

        expect(page).to have_content('Remove')
      end
    end
  end
end

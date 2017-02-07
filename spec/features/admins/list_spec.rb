require 'rails_helper'

feature 'Admin List', js: true do
  before(:each) do
    @admin = create(:admin)
  end

  scenario 'admin not logged in' do
    AdminListPage.visit

    expect(page).not_to have_content('Admins')
  end

  feature 'admin logged in' do
    before(:each) do
      LoginPage.complete_login(@admin.email, @admin.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'admins are present' do
      AdminListPage.visit

      expect(page).to have_content('Admins')
      expect(page).to have_content(Admin.first.email)
    end
  end
end

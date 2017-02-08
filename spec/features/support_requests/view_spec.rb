require 'rails_helper'

feature 'Support Request View', js: true do
  before do
    @customer = create(:customer)

    @support_request = create(
      :support_request,
      :customer => @customer
    )
  end

  scenario 'user not logged in' do
    SupportRequestViewPage.visit(@support_request.id)

    expect(page).not_to have_content('Support Request')
  end

  scenario 'customer viewing another customer\'s support requests' do
    @another_customer = create(:customer)

    LoginPage.complete_login(@another_customer.email, @another_customer.password)

    expect(page).to have_content('Support Requests')

    SupportRequestViewPage.visit(@support_request.id)

    expect(page).not_to have_content('Description')
  end

  feature 'user logged in' do
    before do
      LoginPage.complete_login(@customer.email, @customer.password)

      expect(page).to have_content('Support Requests')
    end

    scenario 'support request is present' do
      find("a", text: "View").click

      expect(page).to have_content('Description')
    end

    feature 'close' do
      before do
        @support_request.status = "open"
        @support_request.save

        find("a", text: "View").click

        expect(page).to have_content('Description')
      end

      scenario 'closes support request on click' do
        expect(page).not_to have_content('Closed')

        find("button", text: "Close").click

        expect(page).to have_content('Closed At')

        expect(page).to have_content('Closed')
      end
    end
    feature 'reopen' do
      before do
        @support_request.status = "closed"
        @support_request.save

        find("a", text: "View").click

        expect(page).to have_content('Description')
      end
      scenario 'reopens support request on click' do
        expect(page).not_to have_content('Open')

        find("button", text: "Reopen").click

        expect(page).not_to have_content('Closed At')

        expect(page).to have_content('Open')
      end
    end
  end
end

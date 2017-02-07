FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    type "Customer"
  end

  factory :customer, parent: :user, class: 'Customer' do
    type "Customer"
  end

  factory :agent, parent: :user, class: 'Agent' do
    type "Agent"
  end

  factory :admin, parent: :user, class: 'Admin' do
    type "Admin"
  end

  factory :support_request do
    subject "New Support Request"
    customer
    agent
    status "open"
    category "installation_and_setup"
  end
end

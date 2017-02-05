FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    type "Customer"

    factory :confirmed_user do
      after(:create) do |user, evaluator|
        user.confirm
      end
    end

    factory :customer do
      type "Customer"
    end

    factory :agent do
      type "Agent"
    end

    factory :admin do
      type "Admin"
    end
  end

  factory :support_request do
    subject "New Support Request"
  end
end

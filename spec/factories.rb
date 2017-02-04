FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }

    factory :confirmed_user do
      after(:create) do |user, evaluator|
        user.confirm
      end
    end
  end

  factory :support_request do
    subject "New Support Request"
  end
end

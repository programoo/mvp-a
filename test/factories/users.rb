FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "Banana#13" }

    # If using Devise
    password_confirmation { password }
  end
end

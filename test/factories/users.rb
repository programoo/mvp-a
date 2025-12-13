FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }

    # If using Devise
    password_confirmation { password }
  end
end

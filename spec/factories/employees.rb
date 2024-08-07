FactoryBot.define do
  factory :employee do
    name { "John Doe" }
    sequence(:email) { |n| "john#{n}@example.com" }
  end
end
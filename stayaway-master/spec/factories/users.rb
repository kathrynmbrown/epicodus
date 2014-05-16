# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Alice Wonderland"
    email "alicffe@wonderland.com"
    password "password"
    password_confirmation "password"
  end
end

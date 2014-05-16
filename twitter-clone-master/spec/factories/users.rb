FactoryGirl.define do
  factory :user, :class => User do
    email "abc@abc.com"
    handle "@abc"
    password "secret1"
    password_confirmation "secret1"
  end
end

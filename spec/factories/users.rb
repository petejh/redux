FactoryGirl.define do
  factory :user, aliases: [:author], class: User do
    login { Faker::Internet.user_name }
    password "abcd1234"
    password_confirmation "abcd1234"
  end
  
  factory :invalid_user, parent: :user do
    login nil
  end
end

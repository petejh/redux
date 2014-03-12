FactoryGirl.define do
  factory :user, aliases: [:author], class: User do
    login "jerry"
  end
  
  factory :invalid_user, parent: :user do
    login nil
  end
end

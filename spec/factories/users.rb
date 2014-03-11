FactoryGirl.define do
  factory :user, aliases: [:author], class: User do
    login "jerry"
  end
end

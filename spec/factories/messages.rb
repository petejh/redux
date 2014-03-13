FactoryGirl.define do
  factory :message do
    text { Faker::HipsterIpsum.sentence }
    author
  end
end

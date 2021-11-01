FactoryBot.define do
  factory :booking do
    association :user
    association :flight
  end
end

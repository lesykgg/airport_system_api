FactoryBot.define do
  factory :flight do
    from { Faker::Address.city }
    destination { Faker::Address.city }

    departure { Time.now }
    arrival { Time.now + 2.hours }
  end
end

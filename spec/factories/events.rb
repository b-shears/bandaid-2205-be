FactoryBot.define do
  factory :event do
    name { Faker::Commerce.material }
    date { Faker::Date.forward(days: 23) }
    start_time { Faker::Time.between(from: Time.now + 1, to: Time.now + 4, format: :short) }
    end_time { Faker::Time.between(from: Time.now + 6, to: Time.now + 8, format: :short) }
    category { Faker::Company.industry }
    rating { Faker::Number.within(range: 1..5) }
    venue { create(:venue) }
  end
end

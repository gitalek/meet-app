# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::Book.title }
    description { Faker::Quote.matz }
    location { Faker::Address.city }
    start_time { Faker::Date.forward(days: 30) }
    end_time do
      Faker::Date.between(
        from: start_time,
        to: start_time + 30.days
      )
    end
    organizer_email { Faker::Internet.email }
    organizer_telegram { "@#{Faker::Internet.username(specifier: 5..8)}" }
    link { Faker::Internet.url }
  end
end
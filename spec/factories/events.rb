# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::Book.title }
    description { Faker::Quote.matz }
    location { Faker::Address.city }
    start_time {}
    end_time {}
    organizer_email { Faker::Internet.email }
    organizer_telegram {}
    link {}
  end
end
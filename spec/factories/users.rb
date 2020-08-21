# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    # username { Faker::Internet.username(specifier: 5..20) }

    after(:build) {|u| u.password = u.password_confirmation = Faker::Internet.password}
  end
end

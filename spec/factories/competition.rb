# frozen_string_literal: true

FactoryBot.define do
  factory :competition do
    name { Faker::Lorem.word }
    date { Faker::Date.in_date_period }
    location { Faker::Address.street_address }
    gender { Faker::Gender.binary_type.downcase }
  end
end

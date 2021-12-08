# frozen_string_literal: true

FactoryBot.define do
  factory :fencer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { Faker::Gender.binary_type.downcase }
    birthday { Faker::Date.in_date_period }
    country { Faker::Address.country }
  end
end

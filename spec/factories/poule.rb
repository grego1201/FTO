# frozen_string_literal: true

FactoryBot.define do
  factory :poule do
    number { Faker::Name.first_name }
    piste { Faker::Name.last_name }
    competition { create(:competition) }
  end
end

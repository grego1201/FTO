# frozen_string_literal: true
FactoryBot.define do
  factory :match do
    left_points { 1 }
    right_points { 1 }
    priority { false }
  end
end

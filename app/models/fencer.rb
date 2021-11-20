# frozen_string_literal: true

class Fencer < ApplicationRecord
  GENDERS = %w[male female other]

  has_and_belongs_to_many :competitions

  validates_presence_of :first_name
  validates :gender, inclusion: { in: GENDERS, message: 'Gender not valid' }
end

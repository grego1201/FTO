# frozen_string_literal: true

class Competition < ApplicationRecord
  CATEGORIES = %w[u11 u13 u15 u17 u20 u23 abs vet]
  GENDERS = %w[male female other mix]

  has_and_belongs_to_many :fencers
  has_and_belongs_to_many :referees
  has_many :poules

  validates_presence_of :name, :date, :gender
  validates :gender, inclusion: { in: GENDERS, message: 'Gender not valid' }
  validates :category, inclusion: { in: CATEGORIES, message: 'category not valid' }, allow_nil: true
end

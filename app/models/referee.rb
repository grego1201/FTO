# frozen_string_literal: true

class Referee < ApplicationRecord
  has_and_belongs_to_many :competitions
  has_many :poules

  validates_presence_of :first_name
end

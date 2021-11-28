# frozen_string_literal: true

class Referee < ApplicationRecord
  has_and_belongs_to_many :competitions

  validates_presence_of :first_name
end

# frozen_string_literal: true

class Poule < ApplicationRecord
  belongs_to :competition
  belongs_to :referee, optional: true

  has_many :matches

  validates_presence_of :number, :piste
end

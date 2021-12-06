# frozen_string_literal: true

class Poule < ApplicationRecord
  belongs_to :competition
  belongs_to :referee, optional: true

  validates_presence_of :number, :piste
end

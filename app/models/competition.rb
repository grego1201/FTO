# frozen_string_literal: true

class Competition < ApplicationRecord
  validates_presence_of :name, :date, :gender
  validates :gender, inclusion: { in: %w[male female other mix], message: 'Gender not valid' }
  validates :category, inclusion: { in: %w[u11 u13 u15 u17 u20 u23 abs vet],
                                    message: 'category not valid' }, allow_nil: true
end

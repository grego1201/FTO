# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :poule, optional: true

  belongs_to :right_fencer, class_name: 'Fencer', foreign_key: :right_fencer_id
  belongs_to :left_fencer, class_name: 'Fencer', foreign_key: :left_fencer_id
end

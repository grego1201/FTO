# frozen_string_literal: true
class CreateCompetitionFencerJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :competitions, :fencers do |t|
      t.index [:fencer_id, :competition_id]
      t.index [:competition_id, :fencer_id]
    end
    add_foreign_key :competitions_fencers, :competitions
    add_foreign_key :competitions_fencers, :fencers
  end
end

# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :left_points
      t.integer :right_points
      t.boolean :priority

      t.timestamps
    end

    add_reference :matches, :poule
    add_reference :matches, :referee

    add_reference :matches, :right_fencer, index: true, foreign_key: { to_table: :fencers }
    add_reference :matches, :left_fencer, index: true, foreign_key: { to_table: :fencers }
  end
end

# frozen_string_literal: true
class CreatePoules < ActiveRecord::Migration[6.1]
  def change
    create_table :poules do |t|
      t.integer :number
      t.integer :piste

      t.timestamps
    end

    add_reference :poules, :competition
    add_reference :poules, :referee
  end
end

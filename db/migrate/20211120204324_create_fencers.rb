# frozen_string_literal: true

class CreateFencers < ActiveRecord::Migration[6.1]
  def change
    create_table :fencers do |t|
      t.string :first_name, required: true
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :country

      t.timestamps
    end
  end
end

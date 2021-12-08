# frozen_string_literal: true

class CreateReferee < ActiveRecord::Migration[6.1]
  def change
    create_table :referees do |t|
      t.string :first_name, required: true
      t.string :last_name
      t.string :country

      t.timestamps
    end
  end
end

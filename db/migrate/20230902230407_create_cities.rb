# frozen_string_literal: true

# This migration is responsible for creating the cities table.
class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :state, foreign_key: true

      t.timestamps
    end

    add_index :cities, %i[name state_id], unique: true
  end
end

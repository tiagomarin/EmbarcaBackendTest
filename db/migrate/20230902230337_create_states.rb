# frozen_string_literal: true

# This migration is responsible for creating the states table.
class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name

      t.timestamps
    end

    add_index :states, :name, unique: true
  end
end

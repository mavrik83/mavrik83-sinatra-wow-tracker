# frozen_string_literal: true

# migration for character table
class CreateCharacters < ActiveRecord::Migration[4.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :intellect
      t.integer :strength
      t.integer :stamina
      t.integer :agility
      t.integer :haste
      t.integer :versatility
      t.integer :mastery
      t.integer :crit_chance
      t.integer :user_id
    end
  end
end

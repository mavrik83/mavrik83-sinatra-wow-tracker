class CreateCharacters < ActiveRecord::Migration
    
    def change
        create_table :characters do |t|
            t.string :name
            t.string :intellect
            t.string :strength
            t.string :stamina
            t.string :agility
            t.string :haste
            t.string :versatility
            t.string :mastery
            t.string :crit_chance
            t.integer :user_id
        end
    end

end
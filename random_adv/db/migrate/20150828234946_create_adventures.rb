class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
    	t.string :location
    	t.integer :price_per_person
    	t.integer :price_event
    	t.boolean :price_per_person
    	t.string :hints
        t.timestamps
    end
  end
end

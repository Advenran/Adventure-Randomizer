class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :location
    	t.integer :price_per_person
    	t.integer :price_event
    	t.boolean :price_per_person
    	t.integer :timeframe
    end
  end
end

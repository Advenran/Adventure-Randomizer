class CreatePrevAdventures < ActiveRecord::Migration
  def change
    create_table :prev_adventures do |t|
    	t.integer :user_id
    	t.integer :adventure_id
    	t.timestamps
    	t.string :mode_of_travel
    end
  end
end

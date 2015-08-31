class CreatePrevAdventures < ActiveRecord::Migration
  def change
    create_table :prev_adventures do |t|
    	t.integer :user_id
    	t.integer :adventure_id
    	t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.float :latitude
  		t.float :longitude
  		t.integer :user_id
  		t.timestamps
  	end
  end
end

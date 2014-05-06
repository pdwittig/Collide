class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :latitude
  		t.string :longitude
  		t.integer :user_id
  		t.timestamps
  	end
  end
end

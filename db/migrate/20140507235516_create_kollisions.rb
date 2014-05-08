class CreateKollisions < ActiveRecord::Migration
  def change
  	create_table :kollisions do |t|
  		t.integer :event_id
  		t.integer :kolliding_event_id
  	end
  end
end

class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.datetime :begin
      t.datetime :end
      t.string :room
      t.integer :conference_id
	  t.integer :track_id

      t.timestamps
    end
  end
end

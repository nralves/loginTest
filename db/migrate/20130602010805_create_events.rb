class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :abstract
	  t.integer :block_id
      t.timestamps
    end
  end
end

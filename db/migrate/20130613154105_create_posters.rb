class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :name
      t.text :description
      t.string :file
	  t.string :poster
      t.integer :block_id
      t.integer :votes

      t.timestamps
    end
  end
end

class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :name
      t.text :description
      t.string :file
      t.integer :conference_id
      t.integer :votes

      t.timestamps
    end
  end
end

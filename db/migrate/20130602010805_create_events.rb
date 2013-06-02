class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :room
      t.datetime :begin
      t.datetime :end

      t.timestamps
    end
  end
end

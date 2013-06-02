class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.datetime :begin
      t.datetime :end
      t.string :location
      t.string :logo

      t.timestamps
    end
  end
end

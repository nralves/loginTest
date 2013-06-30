class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :title
      t.string :organization
      t.string :country
      t.string :homepage
      t.string :resume
      t.string :photo
	  t.string :email
	  t.integer :user_id

      t.timestamps
    end
  end
end

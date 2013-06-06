class AddImageToLecturers < ActiveRecord::Migration
  def change
    add_column :lecturers, :image, :string
  end
end

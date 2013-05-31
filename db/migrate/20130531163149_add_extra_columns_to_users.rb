class AddExtraColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
	add_column :users, :title, :string
	add_column :users, :organization, :string
	add_column :users, :homepage, :string
	add_column :users, :photo, :string
  end
end

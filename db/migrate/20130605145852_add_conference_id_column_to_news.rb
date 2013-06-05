class AddConferenceIdColumnToNews < ActiveRecord::Migration
  def change
	add_column :news, :conference_id, :integer
  end
end

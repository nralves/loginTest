class CreateUsersConferencesJoin < ActiveRecord::Migration
  def up
	create_table 'conferences_users', :id => false do |t|
      t.column 'user_id', :integer
      t.column 'conference_id', :integer
    end
  end

  def down
	drop_table 'conferences_users'
  end
end

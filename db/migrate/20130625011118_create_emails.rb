class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.string :activation
      t.boolean :confirmed
	  t.integer :user_id

      t.timestamps
    end
  end
end

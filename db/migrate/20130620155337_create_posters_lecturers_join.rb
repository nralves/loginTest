class CreatePostersLecturersJoin < ActiveRecord::Migration
    def up
	create_table 'lecturers_posters', :id => false do |t|
      t.column 'poster_id', :integer
      t.column 'lecturer_id', :integer
    end
  end

  def down
	drop_table 'lecturers_posters'
  end
end

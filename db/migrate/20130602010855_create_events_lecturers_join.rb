class CreateEventsLecturersJoin < ActiveRecord::Migration
  def up
	create_table 'events_lecturers', :id => false do |t|
      t.column 'event_id', :integer
      t.column 'lecturer_id', :integer
    end
  end

  def down
	drop_table 'events_lecturers'
  end
end

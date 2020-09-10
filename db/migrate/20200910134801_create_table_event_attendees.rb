class CreateTableEventAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :table_event_attendees do |t|
      t.integer :event_attendee_id
      t.integer :attendee_id
    end
  end
end

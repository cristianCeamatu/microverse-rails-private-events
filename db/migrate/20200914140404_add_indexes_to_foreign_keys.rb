class AddIndexesToForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_index :event_attendees, :attended_event_id
    add_index :event_attendees, :event_attendee_id
    add_index :events, :creator_id
  end
end

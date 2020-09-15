class ChangeTableEventAttendees < ActiveRecord::Migration[6.0]
  def change
    change_table :event_attendees do |t|
      t.change :attended_event_id, :integer, null: false, foreign_key: true
      t.change :event_attendee_id, :integer, null: false, foreign_key: true
    end
  end
end

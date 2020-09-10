class User < ApplicationRecord
    has_many :event_attendees, foreign_key: :event_attendee_id
    has_many :attended_events, through: :event_attendees, class_name: 'Event'
    has_many :created_events, class_name: "Event", foreign_key: "creator_id"
end

class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, foreign_key: :event_attendee_id
    has_many :attendees, through: :event_attendees, source: :attendee_id
end

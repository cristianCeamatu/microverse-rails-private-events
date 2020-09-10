class EventAttendee < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :event_attendee, class_name: "Event"

end

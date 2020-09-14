class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendees, class_name: 'Event'
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 }
end

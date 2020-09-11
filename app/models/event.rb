class Event < ApplicationRecord
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :event_attendee
  belongs_to :creator, class_name: 'User'

  scope :upcoming_events, -> { where('date > ?', Date.today) }
  scope :past_events, -> { where('date < ?', Date.today) }

  validates :date, presence: true
  validates :location, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
end

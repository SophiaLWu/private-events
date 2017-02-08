class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :attendees, :through => :invitations
  has_many :invitations, :foreign_key => "attended_event_id"

  scope :upcoming, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}
end

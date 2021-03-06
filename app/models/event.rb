class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :attendees, :through => :invitations
  has_many :invitations, :foreign_key => "attended_event_id"

  default_scope -> { order(date: :asc) }
  scope :upcoming, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}

  validates :title, presence: true, length: { maximum: 75 }
  validates :date, presence: true
  validates :location, presence: true, length: { maximum: 50 }
end

class User < ApplicationRecord
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :attended_events, :through => :invitations
  has_many :invitations, :foreign_key => "attendee_id"

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end

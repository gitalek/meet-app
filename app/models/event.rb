class Event < ApplicationRecord
  validates :description, :location, presence: true
  validates :title, presence: true, length: { maximum: 75 }
  validates :organizer_email, presence: true, 'valid_email_2/email': true
end

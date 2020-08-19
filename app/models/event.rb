class Event < ApplicationRecord
  belongs_to :user

  MAX_TITLE_LEN = 75

  validates :description, :location, presence: true
  validates :title, presence: true, length: { maximum: MAX_TITLE_LEN }
  validates :organizer_email, presence: true, 'valid_email_2/email': true
end

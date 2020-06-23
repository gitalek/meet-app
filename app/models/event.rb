class Event < ApplicationRecord
  validates :title, :description, :location, :organizer_email, presence: true
  validates :title, length: { maximum: 75 }
end

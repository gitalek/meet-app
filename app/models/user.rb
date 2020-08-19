class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :username, presence: true, length: { maximum: 40 }

  before_validation :set_new_user_random_username, on: :create

  private

  def set_new_user_random_username
    print 'Before if'
    if username.blank?
      rand_name = "#{Faker::Creature::Animal.name}-#{Faker::Number.number(digits: 10)}"
      self.username = rand_name
      print 'Into if'
    end
  end
end

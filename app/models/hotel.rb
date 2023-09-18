class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :user, through: :rooms
  has_many_attached :images, dependent: :destroy

  has_many :bookings

  enum :status, [:open, :closed]
  validates :name, :location, presence: true
 
end

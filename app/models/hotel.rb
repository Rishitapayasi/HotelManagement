class Hotel < ApplicationRecord
  belongs_to :user
  # paginates_per 3
  has_many_attached :images, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :bookings

  enum :status, [:open, :closed]
  validates :name, :location, presence: true
 
end

class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :bookings

  enum :status, [:open, :closed]
  validates :name, :location, presence: true
 
end

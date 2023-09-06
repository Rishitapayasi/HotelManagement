class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :bookings

  enum :status, [:open, :closed]
  validates :name, :location, presence: true
  validate :owner_only_add_hotel
  
  private
  def owner_only_add_hotel
    unless user.type == "Owner"
      errors.add(:base, "Only Owner have permission to add hotels.")      
    end
  end
end

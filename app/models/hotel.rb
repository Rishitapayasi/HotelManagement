class Hotel < ApplicationRecord
  validates :name, :location, presence: true 
  enum :status, [:open, :closed] 

  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :rooms, dependent: :destroy
  has_many :bookings

  private
  def owner_only_add_hotel
    unless user.type == "Owner"
      errors.add(:base, "Only Owner have permission to add hotels.")      
    end
  end
end

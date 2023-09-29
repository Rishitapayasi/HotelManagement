class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :bookings
  has_many_attached :images
 

  enum :status, [:open, :close]
  validates :name, :location, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "status", "updated_at", "user_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["bookings", "images_attachments", "images_blobs", "rooms", "user"]
  end
end

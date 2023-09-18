class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :user, through: :rooms
  has_many_attached :images, dependent: :destroy

  has_many :bookings

  enum :status, [:open, :closed]
  validates :name, :location, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "status", "updated_at", "user_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["bookings", "images_attachments", "images_blobs", "rooms", "user"]
  end
end

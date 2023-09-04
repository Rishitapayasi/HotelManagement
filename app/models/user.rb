class User < ApplicationRecord
  has_secure_password
  
  validates :full_name, presence:true, length: { in: 4..50 }
  validates :email, uniqueness: true, presence: true 
  # validates :role, inclusion: {in: %w(owner customer)} 
  # validates :password_digest,presence: true, length: { maximum: 7 }
  
  has_many :hotels, class_name: "Hotel", foreign_key: "owner_id", dependent: :destroy
  has_many :bookings, class_name: "Booking", foreign_key: "customer_id", dependent: :destroy
end


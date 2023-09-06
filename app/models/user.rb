class User < ApplicationRecord
  has_secure_password
  has_many :hotels, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :full_name, presence: true, length: { in: 4..50 }
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message:"Invalid email id!!!!" } 
  # validates :role, inclusion: {in: %w(owner customer)}
  # validates :password_digest,presence: true, length: { maximum: 7 }

end

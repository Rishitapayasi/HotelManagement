class User < ApplicationRecord
  has_secure_password validations: false  
  has_many :hotels, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :full_name, presence: true, length: { in: 4..50 }
  validates :email,  presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i} 
end

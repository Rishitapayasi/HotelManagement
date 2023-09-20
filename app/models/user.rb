class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_secure_password validations: false  
    has_many :hotels, dependent: :destroy
    has_many :bookings, dependent: :destroy
    has_many :rooms
    has_many :hotels, through: :rooms
    validates :full_name, presence: true, length: { in: 4..50 }
    validates :email,  presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i} 
  
    def customer?
      type == "Customer"
    end

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "email", "full_name", "id", "otp", "password_digest", "type", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["bookings", "hotels", "rooms"]
    end
end 
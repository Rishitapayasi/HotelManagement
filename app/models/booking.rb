class Booking < ApplicationRecord
  validates :check_in_date, :check_out_date, presence: true

  belongs_to :user
  belongs_to :room
  belongs_to :hotel

  private

  def one_user_cant_book_room_again
    if user.bookings.exists?(room_id: room_id)
      errors.add(:base, "You have booked this room already")
    end
  end
end

class Booking < ApplicationRecord

  validates :booking_date_time, presence: true
  belongs_to :user
  belongs_to :chef

end

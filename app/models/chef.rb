class Chef < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_secure_password

  has_many :reviews
  has_many :bookings

end
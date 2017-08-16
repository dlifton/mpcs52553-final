class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  has_many :menus
  has_many :bookings
  has_many :reviews

  # def orders
  #   Order.where(user_id: self.id)
  # end
  has_secure_password

  # file uploads
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "missing_image.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # 1. Expects a column named password_digest
  # 2. Provides an attr_accessor :password
  # 3. Provides a method named .authenticate(pwd)

end

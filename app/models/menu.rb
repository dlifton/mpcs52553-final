class Menu < ApplicationRecord
  belongs_to :user

  has_many :reviews
  has_many :foods

  has_attached_file :menuimage, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "missing_image.png"
  validates_attachment_content_type :menuimage, content_type: /\Aimage\/.*\z/
end
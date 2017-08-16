class Food < ApplicationRecord
  belongs_to :menu

  has_attached_file :foodimage, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "missing_image.png"
  validates_attachment_content_type :foodimage, content_type: /\Aimage\/.*\z/
end
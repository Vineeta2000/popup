class Post < ApplicationRecord

 has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :photos , dependent: :destroy
  has_many :comments , dependent: :destroy
end

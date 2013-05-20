class Micropost < ActiveRecord::Base
  attr_accessible :content, :name, :image, :remote_image_url, :rating
  belongs_to :user

  mount_uploader :image, ImageUploader

  

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true 
  


end

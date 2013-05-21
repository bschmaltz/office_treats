class Micropost < ActiveRecord::Base
  attr_accessible :content, :name, :image, :remote_image_url, :rating
  belongs_to :user

  #validate :both_image_inputs_not_filled
  mount_uploader :image, ImageUploader

  

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true 
  
  #def both_image_inputs_not_filled
  	#if (!self.image.blank? && !self.remote_image_url.blank? )
  		#errors.add(:image, "file and url cannot both be filled")
  	#end
  #end

end

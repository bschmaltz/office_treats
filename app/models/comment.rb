class Comment < ActiveRecord::Base
  attr_accessible :text, :micropost_id
  belongs_to :user
  belongs_to :micropost

  validates :text, presence: true

  default_scope order: 'comments.created_at DESC'  
end

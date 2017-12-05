class Comment < ApplicationRecord

	belongs_to :commentable, polymorphic:true #before only posts

	validates :user_id, :presence => true
  validates :body, :presence => true, :length => {:in => 10..255}

end

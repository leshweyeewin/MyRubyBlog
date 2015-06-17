class PostComment < ActiveRecord::Base
  attr_accessible :body, :post_id, :user_id
  
  belongs_to :post
  belongs_to :user
  
  validates_presence_of :body
end

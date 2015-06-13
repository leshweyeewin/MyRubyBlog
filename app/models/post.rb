class Post < ActiveRecord::Base
	attr_accessible :title, :body, :category_id, :admin_user_id, :name
	belongs_to :category
	belongs_to :admin_user
	has_many :post_comments, :dependent => :destroy 
	# All comments under the post get deleted if the post is deleted
end

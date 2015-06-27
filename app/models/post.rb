class Post < ActiveRecord::Base
	attr_accessible :title, :body, :category_id, :user_id, :tag_list
	acts_as_taggable

	belongs_to :category
	#belongs_to :admin_user
	belongs_to :user
	has_many :post_comments, :dependent => :destroy 
	# All comments under the post get deleted if the post is deleted
	validates_presence_of :title 
	validates_presence_of :tag_list
	validate :must_exist_in_database
	validates_length_of :body, :minimum => 10

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    ActsAsTaggableOn::Tag.where(name: n.strip).first_or_create!
	  end
	end

	def must_exist_in_database
		self.tags.each do |tag|
			errors.add(tag.name, ' must exist in User or Category database') unless User.find_by_name(tag.name) || Category.find_by_name(tag.name)
		end
	end
end

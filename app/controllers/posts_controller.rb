class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@q = Post.ransack(params[:q])
		@posts = @q.result(distinct:true).order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])
		#@admin_user = AdminUser.all
		@user = User.all
		@post_comment = PostComment.new(:post_id => @post.id)
	end

	def new
		#@post = Post.new
		@post = current_user.posts.build
		@category = Category.all
	end

	def create
		#@post = Post.new(params[:post])
		@post = current_user.posts.build(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved."
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to post_path, :notice => "Your post has been updated."
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted."
	end
end

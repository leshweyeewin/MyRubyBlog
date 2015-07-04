class PostCommentsController < InheritedResources::Base
  #def index
  #	@post = Post.find(params[:post_id])
  #	@post_comments = @post.post_comments.order("created_at DESC")
  #end

  #def show 
  #	@post = Post.find(params[:post_id])
  #	@post_comment = @post.post_comments.find(params[:id])
  #end

  #def new
  #	@post = Post.find(params[:post_id])
  #	@post_comment = @post.post_comments.build(:user_id => current_user.id)
  #end

  def create
  	#@post = Post.find(params[:post_id])
	#@post_comment = @post.post_comments.build(params[:post_comment])
	@post_comment = current_user.post_comments.build(params[:post_comment])
	if @post_comment.save
		redirect_to @post_comment.post, :notice => "Comment was successfully created."
	else
		redirect_to @post_comment.post, :notice => "Error creating post_comment : #{@post_comment.errors}."	
	end
  end

  #def edit
  #	@post = Post.find(params[:post_id])
  #	@post_comment = @post.post_comments.find(params[:id])
  #end

  #def update
  #	@post = Post.find(params[:post_id])
  #	@post_comment = @post.post_comments.find(params[:id])
  #	if @post_comment.update_attributes(params[:post_comment])
  #	redirect_to @post_comment.post, :notice => "Your comment has been updated."
  #else
  #	redirect_to @post_comment.post, :notice => "Error creating post_comment : #{@post_comment.errors}."
	#end
  #end

  #def destroy
  #	@post = Post.find(params[:post_id])
  #	@post_comment = @post.post_comments.find(params[:id])
  #	@post_comment.destroy
  #	redirect_to @post.post_comments, :notice => "Your comment has been deleted."
  #end
end


class PostCommentsController < InheritedResources::Base
  def create
	@post_comment = current_user.post_comments.build(params[:post_comment])
	if @post_comment.save
		redirect_to @post_comment.post, :notice => "Comment was successfully created."
	else
		redirect_to @post_comment.post, :notice => "Error creating post_comment : #{@post_comment.errors}."	
	end
  end
end


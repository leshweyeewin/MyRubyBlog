class PagesController < ApplicationController
  def about
  	@posts = Post.all
  	@categories = Category.all
  end

  def contact
  	@posts = Post.all
  	@categories = Category.all
  end

  def resources
  	@posts = Post.all
  	@categories = Category.all
  end
end

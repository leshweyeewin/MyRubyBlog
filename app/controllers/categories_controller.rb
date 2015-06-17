class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    unless Category.find_by_name(current_user.name)
      @category = Category.create!(:name => current_user.name)
    end
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.name
    @posts = @category.posts
  end
end

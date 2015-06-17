class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if current_user
      unless Category.find_by_name(current_user.name)
        @category = Category.create!(:name => current_user.name)
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.name
    @posts = @category.posts
  end
end

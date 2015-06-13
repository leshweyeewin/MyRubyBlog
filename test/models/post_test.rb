require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "If title is there and body is long enough" do 
  	post = Post.new(:title => "Title", :body => "This is the body of the post.")
  	assert post.valid?
  end
end

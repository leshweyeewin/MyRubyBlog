class AddUserToPostComments < ActiveRecord::Migration
  def change
    add_reference :post_comments, :user, index: true, foreign_key: true
  end
end

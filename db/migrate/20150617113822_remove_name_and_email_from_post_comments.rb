class RemoveNameAndEmailFromPostComments < ActiveRecord::Migration
  def up
    remove_column :post_comments, :name, :string
    remove_column :post_comments, :email, :string
  end
  def down
    add_column :post_comments, :name, :string
    add_column :post_comments, :email, :string
  end
end

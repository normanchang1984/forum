class AddForumIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :forum_id, :integer
    remove_column :forums, :post_id
  end
end

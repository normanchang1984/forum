class AddPostsCountColumnToForums < ActiveRecord::Migration
  def change
    add_column :forums, :posts_count, :integer
  end
end

class AddViewCountColumnToForum < ActiveRecord::Migration
  def change
    add_column :forums, :view_count, :integer
  end
end

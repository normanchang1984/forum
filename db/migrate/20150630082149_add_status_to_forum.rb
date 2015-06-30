class AddStatusToForum < ActiveRecord::Migration
  def change
    add_column :forums, :status, :integer
  end
end

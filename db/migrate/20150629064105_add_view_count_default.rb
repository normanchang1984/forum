class AddViewCountDefault < ActiveRecord::Migration
  def change
    change_column :forums, :view_count, :integer, :default => 0
  end
end

class AddNameSelfintroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selfintro, :text
  end
end

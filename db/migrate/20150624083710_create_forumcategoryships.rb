class CreateForumcategoryships < ActiveRecord::Migration
  def change
    create_table :forumcategoryships do |t|
      t.integer :forum_id
      t.integer :category_id
      t.timestamps null: false
    end
  end
end

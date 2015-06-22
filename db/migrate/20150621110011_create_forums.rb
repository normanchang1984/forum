class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :topic
      t.text :body

      t.timestamps null: false
    end
  end
end
class AddPhotoToForums < ActiveRecord::Migration
  def change
    add_attachment :forums, :photo
  end
end

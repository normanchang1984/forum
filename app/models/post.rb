class Post < ActiveRecord::Base

  belongs_to :forum, :counter_cache => true

  belongs_to :user

end

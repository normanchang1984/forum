class Forum < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  has_many :forumcategoryships
  has_many :categories, :through=>:forumcategoryships, :source=>:category
end

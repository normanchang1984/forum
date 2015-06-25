class Category < ActiveRecord::Base
  has_many :forumcategoryships
  has_many :forums, :through=>:forumcategoryships, :source=>:forum
end

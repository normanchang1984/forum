class Forum < ActiveRecord::Base
  has_many :posts
  belongs_to :user

  has_many :userforumships, :dependent => :destroy

  has_many :users, :through=>:userforumships, :source=>:user
  has_many :forumcategoryships
  has_many :categories, :through=>:forumcategoryships, :source=>:category

  def category_list
    self.categories.map{|x| x.name}.join(" ")
  end

  def name_list
    self.posts.map{|p| p.user.first_name}.uniq.join(" ")
  end



end

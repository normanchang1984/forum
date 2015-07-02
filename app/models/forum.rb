class Forum < ActiveRecord::Base
  has_many :posts
  belongs_to :user

  has_many :userforumships, :dependent => :destroy

  has_many :users, :through=>:userforumships, :source=>:user
  has_many :forumcategoryships
  has_many :categories, :through=>:forumcategoryships, :source=>:category

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def category_list
    self.categories.map{|x| x.name}.join(" ")
  end

  def name_list
    self.posts.map{|p| p.user.first_name}.uniq.join(" ")
  end



end

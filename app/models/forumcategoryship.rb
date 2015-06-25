class Forumcategoryship < ActiveRecord::Base
  belongs_to :forum
  belongs_to :category
end

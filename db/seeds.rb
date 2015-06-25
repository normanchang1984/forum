# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Category.create!(:id=>1, :name=>"Basketball", :position=>1)
Category.create!(:id=>2, :name=>"Baseball", :position=>2)
Category.create!(:id=>3, :name=>"Tennis", :position=>3)

Forumcategoryship.destroy_all
Forumcategoryship.create!(:category_id=>3, :forum_id=>5)
Forumcategoryship.create!(:category_id=>3, :forum_id=>7)

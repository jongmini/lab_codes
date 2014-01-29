class Product < ActiveRecord::Base
	has_many :inventories
	has_many :categories, through: :inventories
end
